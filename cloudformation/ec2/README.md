
Following Template will install Nagios, Prometheus, and Grafana


# Prometheus: 
http://IP-Address-of-EC2:9090
  
# Nagios:
http://IP-Address-of-EC2/nagios
      For Nagios initial credentials: (you can change after first time login)
        Username: nagiosadmin 
        Password: abcd@1234
  
  
# Grafana : 
http://IP-Address-of-EC2:9090
    For grafana initial credentials: (you can change after first time login)
        Username: admin
        Password: admin
  
 # GrayLog 
 http://Internal-IP-Address-of-EC2:9090
 For grafana initial credentials: (you can change after first time login)
        Username: admin
        Password: abcd@1234
 
  # Command to run this template: 
  AWS CLI should be set at us-east-1 region for this template to work
  
  Note: It can take upto 10 mins to initialize all the scripts once EC2 is deployed through template. Please wait or retry after 10 mins to get response. 
  
  `aws cloudformation deploy --template-file <path where you downloaded template> --stack-name <any name you wanna give to this deployment> --parameter-overrides KeyName=<Name of keypair you created in your account in region us-east-1>`
