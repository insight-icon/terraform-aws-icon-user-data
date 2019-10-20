
data "template_file" "citizen" {
  template =<<-EOF
su ubuntu
docker-compose up -d
EOF
}

data "template_file" "prep" {
  template =<<-EOF
su ubuntu
docker-compose up -d
EOF
}

data "template_file" "sentry" {
  template =<<-EOF
su ubuntu
docker-compose up -d
EOF
}

data "template_file" "mount_ebs" {
  template =<<-EOF
EOF
}

data "template_file" "mount_ebs_nvme" {
  template =<<-EOF
EOF
}

data "template_file" "user_data" {
  template = <<-EOF
#!/usr/bin/env bash

${var.consul_enabled ? data.template_file.consul.rendered : ""}
${var.consul_enabled && var.prometheus_enabled ? data.template_file.prometheus_consul.rendered : ""}

${var.type == "citizen" ? data.template_file.citizen.rendered : ""}
${var.type == "prep" ? data.template_file.prep.rendered : ""}
${var.type == "sentry" ? data.template_file.sentry.rendered : ""}
${var.type == "bastion_s3" ? data.template_file.bastion_s3.rendered : ""}
EOF

  vars = {}
}

