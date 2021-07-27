output "frontend_sg_id"{
    value = aws_security_group.ramp_up_tf_andreslopezb_frontend.id
}

output "frontend_lb_sg_id"{
    value = aws_security_group.ramp_up_tf_andreslopezb_frontend_lb.id
}
