resource oci_core_vcn export_DBSec_VCN_tf {
  cidr_block     = "10.0.0.0/16"
  compartment_id = "${var.compartment_ocid}"
  defined_tags   = {}

  display_name = "DBSec_VCN"
  dns_label    = "dbsecvcn"
}

resource oci_core_default_dhcp_options export_Default-DHCP-Options-for-DBSec_VCN {
  defined_tags = {}

  display_name = "Default DHCP Options for DBSec_VCN"

  manage_default_resource_id = "${oci_core_vcn.export_DBSec_VCN_tf.default_dhcp_options_id}"

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

resource oci_core_internet_gateway export_Internet-Gateway-DBSec_VCN {
  compartment_id = "${var.compartment_ocid}"
  defined_tags   = {}

  display_name = "Internet Gateway-DBSec_VCN"
  enabled      = "true"

  vcn_id = "${oci_core_vcn.export_DBSec_VCN_tf.id}"
}

resource oci_core_default_route_table export_Default-Route-Table-for-DBSec_VCN {
  defined_tags = {}

  display_name = "Default Route Table for DBSec_VCN"

  manage_default_resource_id = "${oci_core_vcn.export_DBSec_VCN_tf.default_route_table_id}"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.export_Internet-Gateway-DBSec_VCN.id}"
  }
}


resource oci_core_default_security_list export_Default-Security-List-for-DBSec_VCN {
  defined_tags = {}

  display_name = "Default Security List for DBSec_VCN"

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

  manage_default_resource_id = "${oci_core_vcn.export_DBSec_VCN_tf.default_security_list_id}"
}

resource oci_core_subnet export_dbsecsubnet {
  cidr_block     = "10.0.0.0/24"
  compartment_id = "${var.compartment_ocid}"
  defined_tags   = {}

  dhcp_options_id = "${oci_core_vcn.export_DBSec_VCN_tf.default_dhcp_options_id}"
  display_name    = "dbsecsubnet"
  dns_label       = "dbsecsubnet"

  prohibit_public_ip_on_vnic = "false"
  route_table_id             = "${oci_core_vcn.export_DBSec_VCN_tf.default_route_table_id}"

  security_list_ids = [
    "${oci_core_vcn.export_DBSec_VCN_tf.default_security_list_id}",
  ]

  vcn_id = "${oci_core_vcn.export_DBSec_VCN_tf.id}"
}