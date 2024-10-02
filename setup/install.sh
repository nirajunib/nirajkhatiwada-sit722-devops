# Updarte and install Java 11
sudo apt update
sudo apt install openjdk-11-jdk
# Install Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az login
# Setup Azure Kubernetes Service
az account set --subscription <subs-id>
az aks get-credentials --resource-group deakinuni --name aksdevops --overwrite-existing
# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/bin/
# Install Docker
sudo apt-get install docker.io
sudo systemctl start docker
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
# Grant permissions to Jenkins
sudo chown -R ubuntu:jenkins /home/ubuntu/.kube
sudo chmod -R 770 /home/ubuntu/.kube
# Install Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.54.1/prometheus-2.54.1.linux-amd64.tar.gz
tar -xvf prometheus-2.54.1.linux-amd64.tar.gz
# Install Grafaana
sudo apt-get install -y adduser libfontconfig1 musl
wget https://dl.grafana.com/oss/release/grafana_11.2.2_amd64.deb
sudo dpkg -i grafana_11.2.2_amd64.deb
sudo /bin/systemctl start grafana-server