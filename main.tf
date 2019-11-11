locals {
  ebs_attachment = contains(["citizen", "prep"], var.type)
}

data "template_file" "nitro" {
  template =<<-EOF
apt-get upgrade -y linux-aws
file -s /dev/nvme0n1
mkdir /data
chown -R ubuntu:ubuntu /data
mkfs -t xfs /dev/nvme0n1
mount /dev/nvme0n1 /data
EOF
}

data "template_file" "standard" {
  template =<<-EOF
mkdir /data
chown -R ubuntu:ubuntu /data/
mkfs.ext4 /dev/xvdf
mount /dev/xvdf /data
EOF
}

data "template_file" "disable_ipv6" {
  template =<<-EOF
sudo sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT="maybe-ubiquity"/GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 maybe-ubiquity"/' /etc/default/grub
sudo sed -i -e 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="ipv6.disable=1"/' /etc/default/grub
sudo update-grub
EOF
}

data "template_file" "citizen" {
  template =<<-EOF
su ubuntu
docker-compose -f /home/ubuntu/docker-compose.yml up -d
EOF
}

data "template_file" "prep" {
  template =<<-EOF
echo "Nothing special, starting node with ansible"
EOF
}

//su ubuntu
//docker-compose -f /home/ubuntu/docker-compose.yml up -d


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
${var.disable_ipv6 ? data.template_file.disable_ipv6.rendered : ""}
${var.consul_enabled ? data.template_file.consul.rendered : ""}
${var.consul_enabled && var.prometheus_enabled ? data.template_file.prometheus_consul.rendered : ""}
${var.driver_type == "nitro" && local.ebs_attachment ? data.template_file.nitro.rendered : ""}
${var.driver_type == "standard" && local.ebs_attachment ? data.template_file.standard.rendered : ""}
${var.type == "citizen" ? data.template_file.citizen.rendered : ""}
${var.type == "prep" ? data.template_file.prep.rendered : ""}
${var.type == "nat" ? data.template_file.nat.rendered : ""}
${var.type == "sentry" ? data.template_file.sentry.rendered : ""}
${var.type == "bastion_s3" ? data.template_file.bastion_s3.rendered : ""}
EOF

  vars = {}
}

