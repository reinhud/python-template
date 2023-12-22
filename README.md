# Python Project Template 🐍

This repository serves as a template for Python projects, providing a robust and standardized project structure that's easy to use and adapt. It includes support for containerization with Docker and integrates popular Python tools such as Poetry for dependency management, Black for code formatting, Isort for import sorting, and Flake8 for code linting.


## Features 🌟

- **Docker Integration**: Includes a multi-stage Dockerfile for creating lightweight, secure production images.
- **Poetry for Dependency Management**: Simplifies package management and virtual environment handling.
- **Code Formatting with Black**: Ensures consistent code formatting throughout the project.
- **Import Sorting with Isort**: Automatically sorts imports for better readability and organization.
- **Code Linting with Flake8**: Enforces coding standards and helps identify potential errors.


## Docker Environment 🐳

The provided Dockerfile contains multiple stages:

- **Base Stage**: Sets up the Python environment and installs Poetry.
- **Dependency Stage (`deps`)**: Installs the project's runtime dependencies.
- **Development Stage (`dev`)**: Installs development dependencies and tools.
- **Production Stage (`prod`)**: Builds the production image, running as a non-root user for security.


## Getting Started 🚀

To get started with this template:

1. **Clone the Repository**: Clone this repository to create a new project.
2. **Install Dependencies**: Use Poetry to install further dependencies.
```
poetry add <package-name>
```
For more options please follow the [Poetry](https://python-poetry.org) documentation.

## Running the Application 🏃
Locally: Run your application directly from your preferred IDE or from the command line.
**Using Docker (For Production)**: Build and run the Docker image.

```
docker build -t your-app-name .
docker run your-app-name
```
**Using DevContainer (For Development)**:
- Ensure you have [Visual Studio Code](https://code.visualstudio.com/) and the [Dev - Containers extension](https://code.visualstudio.com/docs/devcontainers/containers) installed.
- Open the project folder in VS Code.
- When prompted, reopen the folder in a DevContainer or use the command palette (`Ctrl+Shift+P`) to run the "Dev Containers: Reopen in Container" 

## Using Linting and Formatting Tools 🛠️

- Black for Formatting:
```
black .
```

- Isort for Import Sorting: 
```
isort .
```

- Flake8 for Linting:  
```
flake8 .
```


## Contributing 🤝

Contributions are welcome! Please read our [contributing guidelines](CONTRIBUTING.md) before submitting pull requests.


## License 📄

This project is licensed under the [MIT License](LICENSE).

