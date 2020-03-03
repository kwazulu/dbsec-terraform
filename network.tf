resource "oci_core_vcn" "DBSec_VCN_tf" {
  cidr_block     = "10.0.0.0/16"
  dns_label    = "dbsecvcn"
  compartment_id = "${var.compartment_ocid}"
  display_name = "DBSec_VCN_tf"
}

resource "oci_core_default_dhcp_options" "Default-DHCP-Options-for-DBSec_VCN_tf" {
  manage_default_resource_id = "${oci_core_vcn.DBSec_VCN_tf.default_dhcp_options_id}"
  display_name = "Default DHCP Options for DBSec_VCN_tf"

  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  options {
    type = "SearchDomain"
    search_domain_names = ["dbsecvcn.oraclevcn.com"]
  }
}

resource "oci_core_internet_gateway" "Internet-Gateway-DBSec_VCN_tf" {
  compartment_id = "${var.compartment_ocid}"
  display_name = "Internet-Gateway-DBSec_VCN_tf"
  enabled      = "true"
  vcn_id = "${oci_core_vcn.DBSec_VCN_tf.id}"
}

resource "oci_core_default_route_table" "Default-Route-Table-for-DBSec_VCN_tf" {
  manage_default_resource_id = "${oci_core_vcn.DBSec_VCN_tf.default_route_table_id}"
  display_name = "Default Route Table for DBSec_VCN_tf"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.Internet-Gateway-DBSec_VCN_tf.id}"
  }
}

resource "oci_core_default_security_list" "Default-Security-List-for-DBSec_VCN_tf" {
  manage_default_resource_id = "${oci_core_vcn.DBSec_VCN_tf.default_security_list_id}" 
  display_name = "Default Security List for DBSec_VCN_tf"

// allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }

  // allow outbound udp traffic on a port range
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "17"        
    stateless   = true

    udp_options {
      min = 319
      max = 320
    }
  }

  // allow inbound ssh traffic
  ingress_security_rules {
    protocol  = "6"         
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      min = 22
      max = 22
    }
  }

  // allow inbound icmp traffic of a specific type
  ingress_security_rules {
    protocol  = 1
    source    = "0.0.0.0/0"
    stateless = true

    icmp_options {
      type = 3
      code = 4
    }
  }
}

resource "oci_core_subnet" "dbsecsubnet" {
  cidr_block        = "10.0.0.0/24"
  display_name      = "dbsecsubnet"
  dns_label         = "dbsecsubnet"
  compartment_id    = "${var.compartment_ocid}"
  vcn_id            = "${oci_core_vcn.DBSec_VCN_tf.id}"
  security_list_ids = ["${oci_core_vcn.DBSec_VCN_tf.default_security_list_id}"]
  route_table_id    = "${oci_core_vcn.DBSec_VCN_tf.default_route_table_id}"
  dhcp_options_id   = "${oci_core_vcn.DBSec_VCN_tf.default_dhcp_options_id}"
}