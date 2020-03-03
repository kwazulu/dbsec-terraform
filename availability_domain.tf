data "oci_identity_availability_domain" "AD" {
  compartment_id = "${var.compartment_ocid}"
  ad_number      = "${var.availability_domain_number}"
}
