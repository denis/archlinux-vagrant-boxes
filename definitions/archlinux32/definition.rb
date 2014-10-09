root_password = "vagrant"

Veewee::Definition.declare({
  :memory_size => 512,
  :iso_file => "archlinux-2014.10.01-dual.iso",
  :iso_src => "http://mirrors.kernel.org/archlinux/iso/2014.10.01/archlinux-2014.10.01-dual.iso",
  :iso_md5 => "be377e1a3c36e34ea781c7c05930dd1a",
  :os_type_id => "ArchLinux",
  :boot_wait => 5,
  :boot_cmd_sequence => [
    "<Enter>",
    "<Wait>" * 20,
    "passwd<Enter>",
    "#{root_password}<Enter>",
    "#{root_password}<Enter>",
    "systemctl start sshd.service<Enter>",
  ],
  :ssh_user => "root",
  :ssh_password => root_password,
  :shutdown_cmd => "shutdown -h now",
  :postinstall_files => [
    "00-system.sh",
    "01-sudo.sh",
    "02-locale.sh",
    "03-virtualbox.sh",
    "04-vagrant.sh",
    "05-packages.sh",
    "06-cleanup.sh"
  ],
  :hostiocache => "off"
})
