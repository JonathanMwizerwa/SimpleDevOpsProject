variable "profile" {
  default = "default"
}

variable "instance_count" {
  default = "1"
}

variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvgGkgXMOR0GTYrXuBq1CYXCGVSJLY5Z4ZyRyQMVEWMTWzgvJ6gm5aZLQICGZ+X9DMWZFF602vbjNBzGtzV1J6ce7UCGpz7RbnuPTEuINo7WqoUm2FHmodT8fazwUqGvkse10HCylBBHI+7bX8c4+pYoYi+j9d5d3Cgut2KZrrEHgZvbv48SAyOGPDMo5w+aPFA3D6LxJKBGVWlVH+52EjS0LLNOO/7ATGcjv35jnrgDndK50ZXK3RdS3Z9Fy1Z+lj3+Bi/wscAlodrl6Z3WH3r6NfX/MNLopViPFj6jTbHONyF4anVrSOtqAKyT6udRCKpRqdqz71HeU0O+XXEum5 trust@MacAroni.local"
}

variable "private_key" {
  default = "~/.ssh/id_rsa"
}

variable "ansible_user" {
  default = "ec2-user"
}

