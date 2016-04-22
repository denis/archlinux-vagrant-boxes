root_password = "vagrant"

Veewee::Definition.declare({
  :memory_size => 512,
  :iso_file => "archlinux-2016.04.01-dual.iso",
  :iso_src => "http://mirrors.kernel.org/archlinux/iso/2016.04.01/archlinux-2016.04.01-dual.iso",
  :iso_md5 => "56fac9b3eefdf254a53e519dfcb05168",
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
  :ssh_login_timeout => 10_000,
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
