resource "oci_core_instance" "AVS" {
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
  }

  availability_domain = "${data.oci_identity_availability_domain.AD.name}"
  compartment_id      = "${var.compartment_ocid}"

  create_vnic_details {
    assign_public_ip = "true"
    defined_tags     = {}

    display_name  = "Audit-Vault-Server"

    hostname_label = "av12211"
    nsg_ids        = []

    private_ip             = "10.0.0.151"
    skip_source_dest_check = "false"
    subnet_id              = "${oci_core_subnet.dbsecsubnet.id}"
  }

  display_name      = "Audit-Vault-Server"
  extended_metadata = {}

  fault_domain  = "FAULT-DOMAIN-1"
  freeform_tags = {}

  launch_options {
    boot_volume_type                    = "PARAVIRTUALIZED"
    firmware                            = "BIOS"
    is_consistent_volume_naming_enabled = "false"
    is_pv_encryption_in_transit_enabled = "false"
    network_type                        = "PARAVIRTUALIZED"
    remote_data_volume_type             = "PARAVIRTUALIZED"
  }

  metadata = {
    "ssh_authorized_keys" = "${var.ssh_public_key}"
  }

  shape = "${var.shape_AVServer}"

  source_details {
    boot_volume_size_in_gbs = "500"

    source_id   = "${var.avs_ocid}"
    source_type = "image"
  }

  state = "RUNNING"
}

resource "oci_core_instance_console_connection" "AVS_console_connection" {
    instance_id = "${oci_core_instance.AVS.id}"
    public_key = "${var.ssh_public_key}"
}

resource "oci_core_instance" "DBF" {
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
  }

  availability_domain = "${data.oci_identity_availability_domain.AD.name}"
  compartment_id      = "${var.compartment_ocid}"

  create_vnic_details {
    assign_public_ip = "true"
    defined_tags     = {}

    display_name  = "Database-Firewall"
    freeform_tags = {}

    hostname_label = "dbf12211"
    nsg_ids        = []

    private_ip             = "10.0.0.152"
    skip_source_dest_check = "false"
    subnet_id              = "${oci_core_subnet.dbsecsubnet.id}"
  }

  display_name      = "Database-Firewall"

  fault_domain  = "FAULT-DOMAIN-1"

  launch_options {
    boot_volume_type                    = "PARAVIRTUALIZED"
    firmware                            = "BIOS"
    is_consistent_volume_naming_enabled = "false"
    is_pv_encryption_in_transit_enabled = "false"
    network_type                        = "PARAVIRTUALIZED"
    remote_data_volume_type             = "PARAVIRTUALIZED"
  }

  metadata = {
    "ssh_authorized_keys" = "${var.ssh_public_key}"
  }

  shape = "${var.shape_DBFServer}"

  source_details {
    boot_volume_size_in_gbs = "256"

    source_id   = "${var.dbf_ocid}"
    source_type = "image"
  }

  state = "RUNNING"
}

resource "oci_core_instance_console_connection" "DBF_console_connection" {
    instance_id = "${oci_core_instance.DBF.id}"
    public_key = "${var.ssh_public_key}"
}

resource "oci_core_instance" "DBSec-Lab" {
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
  }

  availability_domain = "${data.oci_identity_availability_domain.AD.name}"
  compartment_id      = "${var.compartment_ocid}"

  create_vnic_details {
    assign_public_ip = "true"
    defined_tags     = {}

    display_name  = "DBSec-Lab"
    freeform_tags = {}

    hostname_label = "dbsec-lab"
    nsg_ids        = []

    private_ip             = "10.0.0.150"
    skip_source_dest_check = "false"
    subnet_id              = "${oci_core_subnet.dbsecsubnet.id}"
  }

  display_name      = "DBSec-Lab"
  fault_domain  = "FAULT-DOMAIN-1"

  launch_options {
    boot_volume_type                    = "PARAVIRTUALIZED"
    firmware                            = "UEFI_64"
    is_consistent_volume_naming_enabled = "true"
    is_pv_encryption_in_transit_enabled = "false"
    network_type                        = "VFIO"
    remote_data_volume_type             = "PARAVIRTUALIZED"
  }

  metadata = {
    "ssh_authorized_keys" = "${var.ssh_public_key}"
  }

  shape = "${var.shape_DBSec_Lab}"

  source_details {
    boot_volume_size_in_gbs = "1000"

    source_id   = "${var.dbl_ocid}"
    source_type = "image"
  }

  state = "RUNNING"
}

resource "oci_core_instance_console_connection" "DBSec_Lab_console_connection" {
    instance_id = "${oci_core_instance.DBSec-Lab.id}"
    public_key = "${var.ssh_public_key}"
}

resource "oci_core_instance" "OKV" {
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
  }

  availability_domain = "${data.oci_identity_availability_domain.AD.name}"
  compartment_id      = "${var.compartment_ocid}"

  create_vnic_details {
    assign_public_ip = "true"
    defined_tags     = {}

    display_name  = "Key-Vault-Server"

    hostname_label = "okv182"
    nsg_ids        = []

    private_ip             = "10.0.0.153"
    skip_source_dest_check = "false"
    subnet_id              = "${oci_core_subnet.dbsecsubnet.id}"
  }

  defined_tags = {}

  display_name      = "Key-Vault-Server"
  extended_metadata = {}

  fault_domain  = "FAULT-DOMAIN-1"

  launch_options {
    boot_volume_type                    = "PARAVIRTUALIZED"
    firmware                            = "BIOS"
    is_consistent_volume_naming_enabled = "false"
    is_pv_encryption_in_transit_enabled = "false"
    network_type                        = "PARAVIRTUALIZED"
    remote_data_volume_type             = "PARAVIRTUALIZED"
  }

  metadata = {
    "ssh_authorized_keys" = "${var.ssh_public_key}"
  }

  shape = "${var.shape_OKVServer}"

  source_details {
    boot_volume_size_in_gbs = "256"

    source_id   = "${var.okv_ocid}"
    source_type = "image"
  }

  state = "RUNNING"
}

resource "oci_core_instance_console_connection" "OKV_console_connection" {
    instance_id = "${oci_core_instance.OKV.id}"
    public_key = "${var.ssh_public_key}"
}
