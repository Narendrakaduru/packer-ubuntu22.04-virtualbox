// virtualbox
source "virtualbox-iso" "virtualbox" {
  boot_command = [
    "c<wait>",
    "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://{{.HTTPIP}}:{{.HTTPPort}}/\"",
    "<enter><wait>",
    "initrd /casper/initrd",
    "<enter><wait>",
    "boot",
    "<enter>"
  ]
  boot_wait            = "5s"
  disk_size            = var.disk_size
  guest_additions_path = "VBoxGuestAdditions.iso"
  guest_os_type        = "Ubuntu_64"
  http_directory       = "http"
  iso_checksum         = var.iso_checksum
  iso_urls             = [var.iso_url]
  shutdown_command     = "echo '${var.ssh_password}' | sudo -S shutdown -P now"
  ssh_username         = var.ssh_username
  ssh_password         = var.ssh_password
  ssh_wait_timeout     = "10000s"
  vm_name              = "${var.name}-vbox"
  vboxmanage = [
    [
      "modifyvm", "${var.name}-vbox",
      "--memory", "${var.memory}"
    ],
    [
      "modifyvm", "${var.name}-vbox",
      "--cpus", "${var.cpus}"
    ]
  ]
}


build {
  sources = [
    "source.virtualbox-iso.virtualbox",
  ]

  // virtualbox
  provisioner "shell" {
    only = ["virtualbox-iso.virtualbox"]
    environment_vars = [
      "DEBIAN_FRONTEND=noninteractive"
    ]
    execute_command   = "echo ${var.ssh_password} | {{.Vars}} sudo -E -S bash '{{.Path}}'"
    expect_disconnect = true
    scripts = [
      "scripts/packages.sh",
      "scripts/vagrant.sh",
      "scripts/virtualbox.sh",
      "scripts/cleanup.sh"
    ]
  }


  post-processor "manifest" {
    output = "stage-1-manifest.json"
  }

  post-processor "vagrant" {
    only   = ["virtualbox-iso.virtualbox"]
    output = "${var.name}_${var.version}.box"
  }

}
