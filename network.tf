resource "oci_core_vcn" "DBSec_VCN_tf" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = "${var.compartment_ocid}"
  defined_tags   = {}

  display_name = "DBSec_VCN_tf"
  dns_label    = "dbsecvcn"
}

resource "oci_core_dhcp_options" "Default-DHCP-Options-for-DBSec_VCN_tf" {
  defined_tags = {}
  
  vcn_id = "${oci_core_vcn.DBSec_VCN_tf.id}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "Default DHCP Options for DBSec_VCN_tf"

  ## manage_default_resource_id = "${oci_core_vcn.DBSec_VCN_tf.default_dhcp_options_id}"

  options {
    custom_dns_servers = []

    server_type = "VcnLocalPlusInternet"
    type        = "DomainNameServer"
  }

  options {
    search_domain_names = [
      "dbsecvcn.oraclevcn.com",
    ]

    type = "SearchDomain"
  }
}

resource "oci_core_internet_gateway" "Internet-Gateway-DBSec_VCN_tf" {
  compartment_id = "${var.compartment_ocid}"
  defined_tags   = {}

  display_name = "Internet Gateway-DBSec_VCN_tf"
  enabled      = "true"

  vcn_id = "${oci_core_vcn.DBSec_VCN_tf.id}"
}

resource "oci_core_route_table" "Default-Route-Table-for-DBSec_VCN_tf" {
  defined_tags = {}
  
  vcn_id = "${oci_core_vcn.DBSec_VCN_tf.id}"
  compartment_id = "${var.compartment_ocid}"

  display_name = "Default Route Table for DBSec_VCN_tf"

  ## manage_default_resource_id = "${oci_core_vcn.DBSec_VCN_tf.default_route_table_id}"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.Internet-Gateway-DBSec_VCN_tf.id}"
  }
}


resource "oci_core_security_list" "Default-Security-List-for-DBSec_VCN_tf" {
  defined_tags = {}

  vcn_id = "${oci_core_vcn.DBSec_VCN_tf.id}"
  compartment_id = "${var.compartment_ocid}"

  display_name = "Default Security List for DBSec_VCN_tf"

  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"

    protocol  = "all"
    stateless = "false"
  }

  ingress_security_rules {
    protocol = "all"

    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }

  ##manage_default_resource_id = "${oci_core_vcn.DBSec_VCN_tf.default_security_list_id}"
}

resource "oci_core_subnet" "dbsecsubnet" {
  cidr_block     = "10.0.0.0/24"
  compartment_id = "${var.compartment_ocid}"
  defined_tags   = {}

  dhcp_options_id = "${oci_core_vcn.DBSec_VCN_tf.default_dhcp_options_id}"
  display_name    = "dbsecsubnet"
  dns_label       = "dbsecsubnet"

  prohibit_public_ip_on_vnic = "false"
  route_table_id             = "${oci_core_vcn.DBSec_VCN_tf.default_route_table_id}"

  security_list_ids = [
    "${oci_core_vcn.DBSec_VCN_tf.default_security_list_id}",
  ]

  vcn_id = "${oci_core_vcn.DBSec_VCN_tf.id}"
}