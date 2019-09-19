module "daemon" {
  source = "./modules/daemon"

  name  = "demo-nginx"
  image = "nginx"
  tag   = "alpine"
  envs = [
    {
      name  = "DEMO_ENV1"
      value = "VALUE1"
    },
    {
      name  = "DEMO_ENV2"
      value = "VALUE2"
    },
  ]
}
