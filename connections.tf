variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}
## variable "bucket_name" {}

provider "oci" {
  version          = ">= 3.0.0"
  tenancy_ocid     = "${var.tenancy_ocid}"
  user_ocid        = "${var.user_ocid}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region           = "${var.region}"
}

variable avs_object_name{ default = "Template_AV-12cR2-bp11" }
variable dbf_object_name{ default = "Template_DBF-12cR2-bp11" }
variable okv_object_name{ default = "Template_OKV-18cR2" }
variable dbl_object_name{ default = "Template_DBSec-Lab" }

variable shape_DBSec_Lab{ default = "VM.Standard2.4" }
variable shape_AVServer{ default = "VM.Standard2.2" }
variable shape_OKVServer{ default = "VM.Standard2.2" }
variable shape_DBFServer{ default = "VM.Standard2.2" }

variable availability_domain_number{ default = "2" }

variable okv_ocid{ default = "ocid1.image.oc1.iad.aaaaaaaap7rdlp5skbstovzv5ojrl4zxzr5dm72eecufpchjgse36wfgywja" }
variable avs_ocid{ default = "ocid1.image.oc1.iad.aaaaaaaacqf6yjfz22zdyf47f2oako72clmq25d4ghot4s7ndu5jrqjhdjba" }
variable dbf_ocid{ default = "ocid1.image.oc1.iad.aaaaaaaag2zbibwzjcrj3v2rxlhhml4fkcn3laoufk5ps46ps4otiomtosaa" }
variable dbl_ocid{ default = "ocid1.image.oc1.iad.aaaaaaaah7ba2y5x5sdx3uj7txl6vunpmupqvas67lqrpbhtnv4hmq2w77qq" }