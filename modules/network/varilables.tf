variable "location"{
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "address_space" {
    
}

variable "tags" {

}

variable "subnets" {
    description = "subnet confi"
    default = [
        {
            name = "subnet1"
            address_prefix = "10.0.1.0/24"
        },
        {
            name = "datasubnet"
            address_prefix = "10.0.2.0/24"
        }
    ]
}