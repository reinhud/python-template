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
2. **Install Dependencies**: Use Poetry to install dependencies.
   ```sh
   poetry install
    ```

## Running the Application 🏃
Locally: Run your application directly from your preferred IDE or from the command line.
Using Docker: Build and run the Docker image for a production build.

    ```sh
    docker build -t your-app-name .
    docker run your-app-name
    ```

## Using Linting and Formatting Tools 🛠️

- Black for Formatting:
    
        ```sh
        black .
        ```
- Isort for Import Sorting:
    
        ```sh
        isort .
        ```
- Flake8 for Linting:
    
        ```sh
        flake8 .
        ```


## Contributing 🤝

Contributions are welcome! Please read our [contributing guidelines](CONTRIBUTING.md) before submitting pull requests.


## License 📄

This project is licensed under the [MIT License](LICENSE).

