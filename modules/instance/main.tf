# Créer l'instance directement sur le réseau public
resource "openstack_compute_instance_v2" "instance" {
  name            = var.instance_name
  flavor_id       = var.flavor_id
  image_id        = var.image_id
  key_pair        = var.key_pair
  security_groups = ["default"]

  network {
    uuid = var.network_id
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              
              cat > /var/www/html/index.html <<'HTML'
              <!DOCTYPE html>
              <html>
              <head>
                  <title>Nginx on OVH</title>
                  <style>
                      body {
                          font-family: Arial, sans-serif;
                          max-width: 800px;
                          margin: 50px auto;
                          padding: 20px;
                          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                          color: white;
                      }
                      h1 { font-size: 2.5em; }
                      .info { background: rgba(255,255,255,0.1); padding: 20px; border-radius: 10px; }
                  </style>
              </head>
              <body>
                  <h1>🚀 Hello from Terraform deployed Nginx!</h1>
                  <div class="info">
                      <p><strong>Instance:</strong> $(hostname)</p>
                      <p><strong>Deployed with:</strong> Terraform + OVH Public Cloud</p>
                  </div>
              </body>
              </html>
              HTML
              EOF
}
