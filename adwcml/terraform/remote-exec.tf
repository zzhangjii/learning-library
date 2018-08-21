/* -------------------- Post Build Execution --------------- */

resource "null_resource" "remote-exec1" {
    provisioner "remote-exec" {
        connection {
			agent 	= false
			timeout = "10m"
			host 	= "${data.oci_core_vnic.InstanceVnic.public_ip_address}"
			user 	= "${var.HostUserName}"
			private_key = "${var.ssh_private_key}"
        }
        inline = [
	"cd /home/opc/instantclient_12_2",
	"export JS_PWD=Alpha2018___",
	"export JS_USR=ADW$((1 + RANDOM % 1000))",
	"export LD_LIBRARY_PATH=/home/opc/instantclient_12_2",
	"export TNS_ADMIN=/home/opc/instantclient_12_2/wallet",
	"/home/opc/instantclient_12_2/cr_ml_user.sh"
        ]
    }
}
