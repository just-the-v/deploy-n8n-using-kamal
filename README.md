# 🚀 n8n-kamal: Deploy n8n using Kamal and GitHub Actions

Hey there! 👋 This project makes deploying n8n easy using Kamal and GitHub Actions. No more complex deployment scripts or manual configurations - just click a button and watch the magic happen! ✨

## 📑 Table of Contents

- [How to Use](#-how-to-use)
- [Machine Setup](#️-machine-setup)
- [Required Secrets and Variables](#-required-secrets-and-variables)
  - [GitHub Secrets](#github-secrets)
  - [GitHub Variables](#github-variables)
  - [Setting Up SSH Keys](#-setting-up-ssh-keys)


## 🎮 How to Use

1. Use this repository as a template
2. Set up your secrets and variables ([see below](#-required-secrets-and-variables))
3. Go to the "Actions" tab in your repository
4. Click on "deploy" workflow
5. Click "Run workflow"
6. Now you can access to your n8n instance ! 🎉

The workflow will handle everything for you:
- Setting up the database
- Configuring n8n
- Deploying your instance
- Setting up SSL certificates

## 🖥️ Machine Setup

Before you can deploy, you'll need a server ready to go! Here's what you need:

1. A server with Ubuntu installed
2. A domain name pointing to your server at port 443 (https)
3. Basic server security setup

For a complete guide on setting up your server securely, you can use [this ansible scripts](https://github.com/guillaumebriday/kamal-ansible-manager) wrote by Guillaume Briday that I use to setup my servers.

## 🔑 Required Secrets and Variables

### GitHub Secrets
These are sensitive values that should be kept private:

- `DOCKER_PASSWORD`: Your Docker Hub password
- `DOCKER_USERNAME`: Your Docker Hub username
- `HOST_IP`: Your server's IP address
- `POSTGRES_PASSWORD`: Password for the PostgreSQL database
- `SSH_PRIVATE_KEY`: Your SSH private key ([see setup below](#-setting-up-ssh-keys))

### GitHub Variables
These are non-sensitive values that can be stored as variables:

- `HOST_USER`: SSH username for your server -> root
- `SUBDOMAIN`: Subdomain for n8n -> n8n
- `DOMAIN_NAME`: Your main domain name -> example.com
- `TIMEZONE`: Your server's timezone -> Europe/Paris
- `N8N_PORT`: Port for n8n -> 5678
- `POSTGRES_PORT`: Port for PostgreSQL -> 5432

### 🔐 Setting Up SSH Keys

You need an SSH Key to let Github perform actions on your server. To do so, you can generate a new SSH key pair, run this command in your terminal:

```bash
ssh-keygen -t ed25519 -C "githubactions@example.com"
```

Then:
1. Copy the contents of `~/.ssh/id_ed25519` (private key) to GitHub Secrets as `SSH_PRIVATE_KEY`
2. Append the contents of `~/.ssh/id_ed25519.pub` (public key) to your server's `~/.ssh/authorized_keys` file

## 🎉 That's It!

You're all set to deploy n8n! Just set up your secrets and variables, and you're ready to go. If you run into any issues, feel free to open an issue in this repository.
