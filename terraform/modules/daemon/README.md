# Daemon module

The daemon module purpose is to create kubernetes deployments that doesn't need to be accessed from the internet.
For example, a daemon is the appropriate module for a chatbot.

## Example

```hcl
module "mychatbot" {
  source = "./modules/daemon"

  name  = "mychatbot"
  image = "me/chatbot"
  tag   = "3.1-alpine"
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
```

## Variables

| name | type | required | description | example |
| ---- | ---- | -------- | ----------- | ------- |
| `name` | string | yes | Name of your deployment/service. | `my-chatbot` |
| `image` | string | yes | Docker image from docker hub. | `python` |
| `tag` | string | yes | Docker image tag. | `3-alpine` |
| `replicas` | number | no | (default: 1) | `2` |
| `envs` | array of dict | no | (default: []) | see [notes](##notes) |

## Notes

### Env variable

The `envs` variable is an array of dicts.
You can declare it as follow:

```hcl
envs = [
  {
    name = "ENV_ONE"
    value = "VALUE1"
  },
  {
    name = "ENV_TWO"
    value = "VALUE2"
  },
]
```
Each dict should contain the `name` and `value` keys.

If you want to use a secret value (api keys, tokens, private keys, etc.) in your tf files, add it [here](https://app.terraform.io/app/manavore/workspaces/manak8s/variables) under the "Environment Variables" and use the HCL variable syntax.

**Please prefix it with your first name to avoid name collision.**

```hcl
envs = [
  {
    name = "MY_SECRET_KEY"
    value = "${var.ETIENNE_MY_SECRET_KEY}"
  },
]
```
