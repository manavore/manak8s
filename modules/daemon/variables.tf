variable "name" {
  type = string
}

variable "image" {
  type = string
}

variable "tag" {
  type = string
}

variable "replicas" {
  type = number
  default = 1
}

# defined like:
# envs = [
#   {
#     name = "ENV_ONE"
#     value = "VALUE1"
#   },
#   {
#     name = "ENV_TWO"
#     value = "VALUE2"
#   },
# ]
variable "envs" {
  default = []
}
