terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.32" # Using a version constraint is a best practice
    }
  }
}

# Your provider configuration remains the same
provider "datadog" {
   api_url = "https://api.us5.datadoghq.com/"
  # DataDog API and APP keys are configured in GitHub Actions secrets
}


resource "datadog_security_monitoring_rule" "console_login_without_mfa" {

  name    = "Console Login without MFA"

  message = <<-EOT
  **Goal:**
  Detects when a user logs into the AWS Management Console without using Multi-Factor Authentication (MFA). 
  This is a critical security control that helps protect against unauthorized access.

  ### Remediation
  Ensure that all users accessing the AWS Management Console are required to use Multi-Factor Authentication (MFA) to enhance security.
  Refer to AWS documentation on [Enabling MFA on the AWS Management Console](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_enable_virtual.html) for guidance.

  **Author:** 'Goodness Adediran' 
  **Date:** 2025-08-23 

  ### False Positives:
    - Legitimate users who have not enrolled in MFA.
    - Legitimate users who are using temporary credentials that do not support MFA.
    - Users accessing the console from trusted networks where MFA is not enforced.
  EOT

  enabled = true

  type = "log_detection"


  query {
    name            = "user_login_without_mfa"
    query           = "source:cloudtrail @evt.name:ConsoleLogin AND @additionalEventData.MFAUsed:No AND @responseElements.ConsoleLogin:Success AND @userIdentity.type:Root"
    group_by_fields = ["@usr.name", "@userIdentity.accountId"]
  }


  case {
    name      = "default_case"
    status    = "high"
    condition = "user_login_without_mfa > 0" # Trigger if any event (count > 0) matches
  }

  options {
    evaluation_window  = 900 # 15 minutes 
    keep_alive         = 3600 # 1 hour
    max_signal_duration = 86400 # 24 hours
    detection_method   = "threshold"
  }

  # Mapped from the "tags" array
  tags = [
    "attack:initial_access",
    "attack:privilege_escalation",
    "attack:persistence",
    "attack:defense_evasion",
    "attack:t1078.004",
    "attack:t1078.001",
    "attack:t1098.001",
  ]
}
