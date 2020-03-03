variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}

provider "oci" {
  version          = ">= 3.0.0"
  tenancy_ocid     = "${var.tenancy_ocid}"
  user_ocid        = "${var.user_ocid}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region           = "${var.region}"
}

variable shape_DBSec_Lab{ default = "VM.Standard2.4" }
variable shape_AV12cR2_bp11{ default = "VM.Standard2.2" }
variable shape_OKV_18cR2{ default = "VM.Standard2.2" }
variable shape_DBF_12cR2_bp11{ default = "VM.Standard2.2" }

variable bucketname
variable O=objectname