# 🚀 Week X – Cloud Infrastructure Homework

---

## 📘 Q & A

### ⚡ High Availability vs Fault Tolerance
High Availability is designed to keep systems running with minimal downtime using redundancy and failover. Fault Tolerance is stronger because the system keeps running with no interruption at all. The downside is cost, so most companies usually aim for High Availability instead of full Fault Tolerance.

---

### 📈 Autoscaling vs Elasticity
Autoscaling automatically adds or removes resources like VMs based on demand. Elasticity is the overall ability to scale up or down when needed.  

- Vertical scaling → increase size of one machine (CPU/RAM)  
- Horizontal scaling → add more machines  

Horizontal scaling is usually better in the cloud because it improves reliability and avoids single points of failure.

---

### 🧩 Managed vs Unmanaged Instance Groups
Managed Instance Groups (MIGs) automatically maintain instances using a template and handle scaling, updates, and autohealing.  
Unmanaged groups require manual control.  

Managed groups are preferred because they keep everything consistent and reduce manual work.

---

### ❤️ Health Checks (Application vs Load Balancer)
Health checks in MIGs are used to detect and replace unhealthy instances.  
Load balancer health checks decide if traffic should be sent to an instance.  

They both check health, but they serve different purposes.

---

### 🏗️ 3-Tier Architecture
3-tier architecture splits an app into:

- **Presentation** → frontend  
- **Application** → backend  
- **Data** → database  

This improves security, scalability, and makes each part easier to manage.

---

# 🧾 Runbook

### 🎯 Goal
Create a managed instance group in GCP using the console that:
- scales automatically  
- replaces unhealthy instances  
- runs across multiple zones  

---

### 📋 Prerequisites
- GCP project with billing enabled  
- Compute Engine enabled  
- Instance template ready  
- Firewall rule open (port 80)  

---

### 🛠️ Create Instance Group
1. Go to **Compute Engine → Instance Groups**  
2. Click **Create Instance Group**  
3. Choose **Managed Instance Group**  
4. Select **Regional**  
5. Pick your instance template  
6. Choose zones and create  

---

### 📊 Autoscaling
- Turn on autoscaling  
- Use CPU (~60%)  
- Set min and max instances  

---

### 🔁 Autohealing
- Add health check (HTTP)  
- Port: 80  
- Path: `/`  
- Delay: ~60 seconds  

---

### 🌍 Multi-Zone Check
- Make sure group is **regional**  
- Confirm instances are in multiple zones  

---

### ⚠️ Important
- Template must be correct  
- Firewall must match VM tag  
- Health check must work  

---

### ✅ Test
- Delete an instance → it should come back  
- Add load → more instances should spin up  

---

# 🛠️ Terraform

### ⚙️ Required for a VM
To create a VM in Terraform, you need:
- name  
- machine type  
- zone  
- boot disk  
- network interface  

These define what the VM is, where it runs, and how it connects.

---

### 🌐 Internal & External IP Output
I output both IPs using the VM’s network interface:

- Internal IP → network IP  
- External IP → NAT IP  

I found this by checking Terraform docs and looking at available attributes.

---

### 🧩 Two Non-Required Arguments
- **tags** → used for firewall rules  
- **metadata_startup_script** → runs a script when the VM starts  

---

### 🖥️ CentOS Stream 10 Image
To find the image, I checked GCP images or used `gcloud compute images list`.  
Then I used the image name/family in the boot disk config.

---

### 🔑 name vs id vs self_link
- **name** → what I choose  
- **id** → unique value from GCP  
- **self_link** → full API path (not a browser link)
