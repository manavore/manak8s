# Daemon module

The daemon module purpose is to create kubernetes deployments that doesn't need to be accessed from the internet.
For example, a daemon is the appropriate module for a chatbot.

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
```hsl
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
