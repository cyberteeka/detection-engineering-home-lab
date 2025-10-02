# 🛡️ Detection as Code - Home Lab 🧪
This project is a home lab for Detection Engineering, focused on enhancing cloud security monitoring. We'll stream AWS CloudTrail 📜 logs from Stratus Red Team ⚔️ attack simulations into Datadog Cloud SIEM 📊. The core of this lab is creating custom Sigma ✍️ detection rules, converting them to Datadog's format, and automating their deployment to Datadog using Terraform 🏗️.

<img width="1916" height="865" alt="image" src="https://github.com/user-attachments/assets/541b4cb9-6b69-4371-bcd9-6c4f26b66159" />

## Detailed Walkthrough
https://medium.com/@goodycyb/detection-as-a-code-home-lab-detect-stratus-red-team-aws-attack-techniques-with-custom-detection-815e984d0cbb


## 🚀 Key Technologies & Tools
☁️ AWS (Amazon Web services): The cloud environment for simulating attacks.

🎯 Stratus Red Team: An open-source tool to emulate adversary tactics in the cloud.

📈 Datadog Cloud SIEM: The SIEM platform for log aggregation, analysis, and threat detection.

✍️ Sigma: A generic, open signature format for SIEM systems.

🏗️ Terraform: An Infrastructure as Code (IaC) tool to automate the deployment of detection rules.

🐙 GitHub & GitHub Actions: For version control and creating a CI/CD pipeline.

## 🛠️ High-Level Steps
⚙️ Setup and Configuration
- Create a free trial account for Datadog Cloud SIEM.

- Set up an AWS sandbox account and configure AWS CloudTrail to stream logs to an S3 bucket.

- Integrate the AWS account with Datadog by deploying the Datadog Forwarder Lambda function.

💥 Simulating Attacks
- Set up Stratus Red Team in the AWS sandbox.

- Execute various AWS attack techniques to generate logs.

🔎 Log Analysis and Detection
- Verify that logs are being ingested into Datadog Log Explorer.

- Enable Datadog Cloud SIEM to analyze the logs.

✍️ Custom Detection Rule Creation
- Write custom detection rules in Sigma (YAML format).

- An example is provided for detecting a "Console Login without MFA."

🤖 Automated Deployment
- Convert Sigma rules into Datadog’s JSON-based detection rule format and manage them using Terraform.

- Set up a GitHub repository for the Sigma rules and Terraform configurations.

- Create a GitHub Actions workflow to automate the deployment of the rules to Datadog Cloud SIEM.

## Summary
This project provides a complete "Detection as Code" workflow, from simulating attacks to automatically deploying custom detection rules. 🎉

<img width="1915" height="661" alt="image" src="https://github.com/user-attachments/assets/3716c491-81d8-465a-9915-d846c39d51db" />
