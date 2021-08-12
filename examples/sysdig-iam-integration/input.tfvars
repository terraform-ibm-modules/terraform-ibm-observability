#####################################################
# Granting IAM permissions to launch sysdig
# Copyright 2020 IBM
#####################################################

########### Access group ########

tags = ["T1", "T2"]

########### Access group memeber ########

ibm_ids = ["abc@in.ibm.com"]

//service_ids = ["ServiceId-1", "ServiceId-2"]

service_ids = ["ServiceId-8543541f-41ef-4e4d-a87f-ffcce", "ServiceId-cfc92f97-a2f5-49ab-b3ed-5f004"]

########### Access group policy ########

/***************************************
Following 3 arguments conflict with each other
  * resources
  * resource_attributes and
  * account_management
Hence while configuring one at a time, unset the other
Following configuration defines 3 policies for Admin, Viewer and Editor
For Admin we set the resources argument and unset the account_management and resource_attributes
For Viewer, we set resource_attributes and unset the account_management and resources
and finally for Editor, we set account_management and unset resource_attributes and resources
****************************************/

policies = {
  admin = {
    roles              = ["Manager", "Viewer", "Editor"]
    account_management = null
    tags               = ["T1", "T2"]
    resources = [{
      region               = "us-south"
      service              = "containers-kubernetes"
      resource_instance_id = "crn:v1:bluemix:public:containers-kubernetes:us-south:a/fcdb764102154c7ea8e1b79d3a64afe0:btgbsard0ss76j8snblg::"
      resource_type        = null
      resource             = null
      resource_group_id    = "19e34037c9fe41e5aa9d682c9089b044"
      attributes = {
        "namespace" = "default"
      }
      },
    ]
    resource_attributes = []
  }

  Viewer = {
    roles              = ["Viewer"]
    account_management = null
    tags               = ["T3", "T4"]

    resources = []

    resource_attributes = [{
      name     = "resource"
      value    = "test123*"
      operator = "stringMatch"
      },
      {
        name     = "serviceName"
        value    = "messagehub"
        operator = null
      },
    ]
  }

  Editor = {
    roles               = ["Viewer"]
    account_management  = false
    tags                = ["T5", "T6"]
    resources           = []
    resource_attributes = []
  }

}

########### Access group dynamic rule ########

dynamic_rules = {
  rule1 = {
    expiration        = 2
    identity_provider = "test-idp.com"
    rule_conditions = [{
      claim    = "blueGroups"
      operator = "CONTAINS"
      value    = "test-bluegroup-saml"
      },
      {
        claim    = "blueGroups"
        operator = "EQUALS"
        value    = "test-bluegroup-saml"
      },
    ]
  }

  rule2 = {
    expiration        = 1
    identity_provider = "test-idp.com"
    rule_conditions = [{
      claim    = "blueGroups"
      operator = "EQUALS"
      value    = "test-bluegroup-saml"
      },
    ]
  }
}
