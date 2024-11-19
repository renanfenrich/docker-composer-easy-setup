# Docker Composer Easy Setup

A ready-to-use template for quickly setting up Docker Compose infrastructures. This repository automates the creation of Docker networks, volumes, and services, allowing for a smooth and efficient setup process.

## Features
- **Automated Setup:** Easily create and manage Docker Compose environments with a single script.
- **Environment-Specific Configuration:** Includes modular `core.yml` for customization.
- **Simplified Workflow:** Run `./init.sh <environment>` to bootstrap your environment.

## Prerequisites
- Docker and Docker Compose installed on your machine.

## Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/renanfenrich/docker-composer-easy-setup.git
   ```
2. Navigate to the repository folder:
   ```bash
   cd docker-composer-easy-setup
   ```
3. Initialize the desired environment:
   ```bash
   ./init.sh development
   ```

## Contribution
Contributions and feedback are welcome! Feel free to:
- Submit issues to report bugs or suggest features.
- Open pull requests for improvements.

Happy composing!
