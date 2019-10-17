
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

data "template_file" "user_data" {
  template = <<-EOF
${var.consult_enabled ? data.template_file.consul.rendered : ""}
${var.consult_enabled && var.prometheus_enabled ? data.template_file.prometheus_consul.rendered : ""}

${var.type == "citizen" ? data.template_file.citizen.rendered : ""}
${var.type == "prep" ? data.template_file.prep.rendered : ""}
${var.type == "sentry" ? data.template_file.sentry.rendered : ""}
EOF

  vars = {}
}

output "user_data" {
  value = data.template_file.user_data.rendered
}