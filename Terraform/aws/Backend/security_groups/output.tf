output "backend_sg_id"{
    value = aws_security_group.ramp_up_tf_andreslopezb_backend.id
}

output "backend_lb_sg_id"{
    value = aws_security_group.ramp_up_tf_andreslopezb_backend_lb.id
}
