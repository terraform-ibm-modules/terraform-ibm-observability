#####################################################
# Granting IAM permissions to launch sysdig
# Copyright 2020 IBM
#####################################################

/****************************************************
Configuration Examples

tags = ["T1","T2"]

roles = ["Manager","Viewer","Editor"]


configure the argument "resources" as follows

resources = [{
    region = "us-south"
    service = "sysdig-monitor"
    resource_instance_id = "crn:v1:bluemix:public:containers-kubernetes:us-south:a/fcdb764102154c7ea8e1b79d3a64afe0:btgbsard0ss76j8snblg::"
    resource_type = null
    resource = null
    resource_group_id = "19e34037c9fe41e5aa9d682c9089b044"
    attributes = null
    },
]

NOTE : Do not specify arguments "account_management" and "resources" at the same time as both conflict with each other.

If you dont want to configure any optional parameter, assign a `null` value to that argument. E.g:
Say we dont want to configure the "account_management", make it null as follows

     account_management = null

******************************************************/


resources = [{
  region               = "us-south"
  service              = "sysdig-monitor"
  resource_instance_id = "crn:v1:bluemix:public:containers-kubernetes:us-south:a/fcdb764102154c7ea8e1b79d3a64afe0:btgbsard0ss76j8snblg::"
  resource_group_id    = "19e34037c9fe41e5aa9d682c9089b044"
  resource_type        = null
  resource             = null
  attributes           = null
  },
]

account_management = null


tags = ["T1", "T2"]

roles = ["Manager", "Viewer", "Editor"]

ibm_ids = ["example@in.ibm.com"]

service_ids = ["ServiceId-1", "ServiceId-2"]



