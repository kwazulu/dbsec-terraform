resource "oci_core_image" "OKV" {
  compartment_id = "${var.compartment_ocid}"

  display_name  = "${var.okv_object_name}"

  image_source_details {
      source_type = "objectStorageTuple"
      bucket_name = "${var.bucket_name}"
      object_name = "${var.okv_object_name}" 
  }
}

resource "oci_core_image" "DBSec-Lab" {
  compartment_id = "${var.compartment_ocid}"

  display_name  = "${var.dbl_object_name}"

  image_source_details {
      source_type = "objectStorageTuple"
      bucket_name = "${var.bucket_name}"
      object_name = "${var.dbl_object_name}" 
  }
}

resource "oci_core_image" "DBF" {
  compartment_id = "${var.compartment_ocid}"

  display_name  = "${var.dbf_object_name}"

  image_source_details {
      source_type = "objectStorageTuple"
      bucket_name = "${var.bucket_name}"
      object_name = "${var.dbf_object_name}" 
  }
}

resource "oci_core_image" "AVS" {
  compartment_id = "${var.compartment_ocid}"

  display_name  = "${var.avs_object_name}"

  image_source_details {
      source_type = "objectStorageTuple"
      bucket_name = "${var.bucket_name}"
      object_name = "${var.avs_object_name}" 
  }
}
