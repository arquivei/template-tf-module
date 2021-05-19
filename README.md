# Terraform Module Template

Template for new Terraform module projects, following the patterns. 

To more infos, read our Notion Page about how we use [Terraform](https://www.notion.so/arquiveiofficial/Terraform-6fc72d7181a34b66899306c4390fb6bd)

---

## Features

- Files `main.tf`, `variables.tf`,`outputs.tf` files to module root path

- `.editorconfig`, `.gitignore` and `.gitattributes` files to module root path

- `.pre-commit-config.yaml` for `terraform fmt`, `terraform-docs` and `check-merge-conflict`

- `example` directory with module usage tf files

---

## Prerequisites

- [terraform](https://learn.hashicorp.com/terraform/getting-started/install#installing-terraform) (v0.15.x)
- [terraform-docs](https://github.com/segmentio/terraform-docs)
- [pre-commit](https://pre-commit.com/#install)

---

## How to start using this template?

To use this template, you need:

  - Download the code 

    ```sh
    git clone URL_REPO
    ```

  - Delete the Git configuration folder, using the command inside the folder created by git clone 
  
    ```sh
    rm -fr .git
    ```

  - On the module's root path, Initialize a new git repository

    ```sh
    git init
    ```

  - For ativate pre-commit, on the module's root path, install pre-commit hooks

    ```sh
    pre-commit install
    ```

  - The file `README.MD` is a template of a readme file for terraform modules. Fill it with the requested information about the module.

---

## Struture

Structure of files and folders for this project.

```
.
├── example
│   ├── main.tf
│   ├── outputs.tf
│   ├── README.md
│   ├── subnets.tf
│   ├── terraform.tfvars_exemple
│   └── variables.tf
├── main.tf
├── outputs.tf
├── README.md
├── resources.tf
├── TEMPLATE-DOC.md
└── variables.tf

```
---

### License

MIT
