output "openvpn_pvt_ip" {
  value = module.openvpn_instance.private_ip
}

output "openvpn_sg_id" {
  value = module.openvpn_security_group.sg_id
}