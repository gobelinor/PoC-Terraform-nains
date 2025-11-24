# PoC-Terraform-nginx

Initialiser Terraform
```
terraform init
```

Vérifier la configuration
```
terraform plan
```

Déployer
```
terraform apply
```

Pour détruire les ressources plus tard
```
terraform destroy
```

Dans environements/lab/terraform.tfvars compléter avec vos vraies valeurs
```
ovh_application_key    = "ovh_appkey"
ovh_application_secret = "ovh_appsecret"
ovh_consumer_key       = "ovh_consumerkey"
ovh_project_id         = "ovh_projectid"

openstack_username = "openstack_username"
openstack_password = "openstack_password"

region        = "UK1"
instance_name = "nginx-lab"
ssh_key_name  = "lab-key"
```
