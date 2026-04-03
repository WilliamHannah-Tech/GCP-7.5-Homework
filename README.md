🚀 SEIR-I Lab 2 — GCP Terraform Deployment
🌎 Iowa VM + Startup Script + HTTP Service (Port 80)
🎯 Project Objective

The goal of this lab was to deploy a Google Cloud Virtual Machine (VM) using Terraform, configure a startup script, and expose a web service accessible over HTTP (port 80).

The deployed VM serves an operational panel with the following endpoints:

🏠 / → Main dashboard
❤️ /healthz → Health check
📊 /metadata → JSON system + network info
💼 Workforce Relevance

This lab represents the transition from manual cloud setup to real-world cloud engineering:

🔁 Reproducible deployments
🧾 Version-controlled infrastructure
🔍 Predictable changes (Terraform plan)
🧠 Infrastructure as Code (IaC)
🏗️ Architecture Overview
☁️ Cloud Components
🖥️ Compute Engine VM
🔥 Firewall Rule (Port 80 open)
⚙️ Startup Script (Auto configuration)
🌍 Region: us-central1 (Iowa)
📍 Zone: us-central1-a
📁 Project Structure
📦 terraform-project/
 ┣ 📜 main.tf
 ┣ 📜 provider.tf
 ┣ 📜 variables.tf
 ┣ 📜 versions.tf
 ┣ 🔐 service-account.json
 ┗ 🧪 gate_lab2_http.sh
⚙️ Terraform Workflow
🔧 Step 1 — Initialize
terraform init
✅ Step 2 — Validate
terraform validate
📊 Step 3 — Plan
terraform plan -out tfplan
🚀 Step 4 — Apply
terraform apply tfplan
🌐 Step 5 — Get URL
terraform output vm_url
🧠 Startup Script Responsibilities

The startup script automatically performs:

📦 Install packages:
nginx
curl
jq
🔍 Collect metadata from GCP
📝 Generate:
/var/www/html/index.html
/var/www/html/metadata.json
🔁 Configure nginx
🔄 Restart web server
🌐 Web Endpoints
Endpoint	Purpose
/	Main dashboard
/healthz	Returns ok
/metadata	JSON system info
🧪 Validation (Gate Test)

Run the official validation script:

VM_IP=$(terraform output -raw vm_external_ip)
VM_IP="$VM_IP" ./gate_lab2_http.sh
✅ Requirements to PASS:
✔️ / returns HTTP 200
✔️ /healthz returns ok
✔️ /metadata is valid JSON
✔️ JSON contains:
region
network.vpc
network.subnet
🔍 Troubleshooting & Lessons Learned
⚠️ 1. Terraform vs Bash Conflict
${} inside scripts caused Terraform errors
✅ Fixed using $${} or removing braces
🔁 2. Startup Script Not Updating
VM did not reflect new script changes
✅ Fixed by recreating VM:
terraform apply -replace="google_compute_instance.traveler_vm"
🌐 3. Default Nginx Page Issue
Saw "Welcome to nginx!" instead of custom page

💡 Meaning:

nginx installed ✔️
custom config NOT applied ❌
🧾 4. No Logging = No Visibility

Added:

exec > >(tee /var/log/startup-script.log) 2>&1
📁 5. Missing Directory

Fixed by adding:

mkdir -p /var/www/html
🔄 6. Nginx Restart Failures

Fixed with:

nginx -t && systemctl restart nginx
📊 Testing Commands

SSH into VM and run:

sudo cat /var/log/startup-script.log
sudo systemctl status nginx
sudo nginx -t
curl localhost
curl localhost/healthz
curl localhost/metadata
📸 Proof of Success

You should have:

✅ Terraform apply success
✅ Working custom webpage
✅ /healthz returns ok
✅ /metadata returns valid JSON
✅ Gate script returns:
Lab 2 Gate: PASS
🏁 Conclusion

This lab successfully demonstrated how to:

🚀 Deploy infrastructure using Terraform
⚙️ Automate configuration with startup scripts
🌐 Serve a web application via nginx
🔍 Validate infrastructure using automated tests

This project reflects real-world cloud engineering practices and reinforces the importance of automation, consistency, and debugging skills.

💪 Final Thought

⚡ “You didn’t click your way here… you automated.”
