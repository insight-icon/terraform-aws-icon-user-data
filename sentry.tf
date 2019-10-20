data "template_file" "nginx_sentry" {
  template = file("${path.module}/sentry/nginx.conf")
  vars = {
    prep_ip = var.prep_ip
  }
}

data "template_file" "sentry" {
  template =<<-EOT
cat<<"EOF" > /home/ubuntu/nginx/nginx.conf
${data.template_file.nginx_sentry.rendered}
EOF
su ubuntu
docker-compose -f /home/ubuntu/docker-compose.yml up -d
EOT
}

