resource oci_core_image export_Template_OKV-18cR2 {
  compartment_id = "${var.compartment_ocid}"

  display_name  = "Template_OKV-18cR2"

  image_source_details {
      source_type = "objectStorageUri"
      source_uri = "${var.source_uri_OKV_18cR2}" 
  }
}

resource oci_core_image export_Template_DBSec-Lab {
  compartment_id = "${var.compartment_ocid}"

  display_name  = "Template_DBSec-Lab"

  image_source_details {
      source_type = "objectStorageUri"
      source_uri = "${var.source_uri_DBSec_Lab}" 
  }
}

resource oci_core_image export_Template_DBF-12cR2-bp11 {
  compartment_id = "${var.compartment_ocid}"

  display_name  = "Template_DBF-12cR2-bp11"

  image_source_details {
      source_type = "objectStorageUri"
      source_uri = "${var.source_uri_DBF_12cR2_bp11}" 
  }
}

resource oci_core_image export_Template_AV-12cR2-bp11 {
  compartment_id = "${var.compartment_ocid}"

  display_name  = "Template_AV-12cR2-bp11"

  image_source_details {
      source_type = "objectStorageUri"
      source_uri = "${var.source_uri_AV_12cR2_bp11}" 
  }
}
