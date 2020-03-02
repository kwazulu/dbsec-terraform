resource "oci_core_instance" "AV12cR2-bp11" {
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
  }

  availability_domain = "${data.oci_identity_availability_domain.AD.name}"
  compartment_id      = "${var.compartment_ocid}"

  create_vnic_details {
    assign_public_ip = "true"
    defined_tags     = {}

    display_name  = "AV12cR2-bp11"

    hostname_label = "av12211"
    nsg_ids        = []

    private_ip             = "10.0.0.151"
    skip_source_dest_check = "false"
    subnet_id              = "${oci_core_subnet.dbsecsubnet.id}"
  }

  display_name      = "AV12cR2-bp11"
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

  shape = "${var.shape_AV12cR2_bp11}"

  source_details {
    boot_volume_size_in_gbs = "500"

    source_id   = "${oci_core_image.Template_AV-12cR2-bp11.id}"
    source_type = "image"
  }

  state = "RUNNING"
}

resource "oci_core_instance_console_connection" "AV12cR2-bp11_console_connection" {
    instance_id = "${oci_core_instance.AV12cR2-bp11.id}"
    public_key = "${var.ssh_public_key}"
}

resource "oci_core_instance" "DBF12cR2-bp11" {
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
  }

  availability_domain = "${data.oci_identity_availability_domain.AD.name}"
  compartment_id      = "${var.compartment_ocid}"

  create_vnic_details {
    assign_public_ip = "true"
    defined_tags     = {}

    display_name  = "DBF12cR2-bp11"
    freeform_tags = {}

    hostname_label = "dbf12211"
    nsg_ids        = []

    private_ip             = "10.0.0.152"
    skip_source_dest_check = "false"
    subnet_id              = "${oci_core_subnet.dbsecsubnet.id}"
  }

  display_name      = "DBF12cR2-bp11"

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

  shape = "${var.shape_DBF_12cR2_bp11}"

  source_details {
    boot_volume_size_in_gbs = "256"

    source_id   = "${oci_core_image.Template_DBF-12cR2-bp11.id}"
    source_type = "image"
  }

  state = "RUNNING"
}

resource "oci_core_instance_console_connection" "DBF12cR2-bp11_console_connection" {
    instance_id = "${oci_core_instance.DBF12cR2-bp11.id}"
    public_key = "${var.ssh_public_key}"
}

resource "oci_core_instance" "DBSec_Lab" {
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
  }

  availability_domain = "${data.oci_identity_availability_domain.AD.name}"
  compartment_id      = "${var.compartment_ocid}"

  create_vnic_details {
    assign_public_ip = "true"
    defined_tags     = {}

    display_name  = "DBSec_Lab"
    freeform_tags = {}

    hostname_label = "dbsec-lab"
    nsg_ids        = []

    private_ip             = "10.0.0.150"
    skip_source_dest_check = "false"
    subnet_id              = "${oci_core_subnet.dbsecsubnet.id}"
  }

  display_name      = "DBSec_Lab"
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

    source_id   = "${oci_core_image.Template_DBSec-Lab.id}"
    source_type = "image"
  }

  state = "RUNNING"
}

resource "oci_core_instance_console_connection" "DBSec_Lab_console_connection" {
    instance_id = "${oci_core_instance.DBSec_Lab.id}"
    public_key = "${var.ssh_public_key}"
}

resource oci_core_instance OKV18cR2 {
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
  }

  availability_domain = "${data.oci_identity_availability_domain.AD.name}"
  compartment_id      = "${var.compartment_ocid}"

  create_vnic_details {
    assign_public_ip = "true"
    defined_tags     = {}

    display_name  = "OKV18cR2"

    hostname_label = "okv182"
    nsg_ids        = []

    private_ip             = "10.0.0.153"
    skip_source_dest_check = "false"
    subnet_id              = "${oci_core_subnet.dbsecsubnet.id}"
  }

  defined_tags = {}

  display_name      = "OKV18cR2"
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

  shape = "${var.shape_OKV_18cR2}"

  source_details {
    boot_volume_size_in_gbs = "256"

    source_id   = "${oci_core_image.Template_OKV-18cR2.id}"
    source_type = "image"
  }

  state = "RUNNING"
}

resource "oci_core_instance_console_connection" "OKV18cR2_console_connection" {
    instance_id = "${oci_core_instance.OKV18cR2.id}"
    public_key = "${var.ssh_public_key}"
}
