# Manak8s

Manavore kubernetes cluster on DigitalOcean.

This repo holds its configuration as code.

## Prerequisite

- Member of the Github Manavore org
- Member of the k8s team
- Access to the terraform.io Manavore org (for secrets)

## Usage

Please use the native kubernetes provider [ressources](https://www.terraform.io/docs/providers/kubernetes/index.html).
Create a file prefixed by your firt name for your project and add the necessary ressources.

## Notes

### Git

Please use [semantic](https://seesparkbox.com/foundry/semantic_commit_messages) git commit messages or your commits will be squash merged.

### Secrets

If you want to use a secret value (api keys, tokens, private keys, etc.) in your tf files, add it [here](https://app.terraform.io/app/manavore/workspaces/manak8s/variables) under the "Environment Variables" and use the HCL variable syntax.

**Please prefix it with your first name to avoid name collision.**

```hcl
variable etienne_my_secret_key {}  # you need to declare it but don't set any value

# [...]

envs = [
  {
    name = "MY_SECRET_KEY"
    value = "${var.etienne_my_secret_key}"
  },
]
```
