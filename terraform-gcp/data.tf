data "template_file" "default" {
    template = file("${path.module}/startup.sh")
}