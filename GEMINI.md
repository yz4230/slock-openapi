# Gemini Project Brief: slock-openapi

This document provides context for the `slock-openapi` project to streamline future development tasks.

## Project Overview

This project uses TypeSpec to define and generate an OpenAPI 3.1.0 specification for the Slock API.

### Technology Stack

*   **API Specification:** TypeSpec
*   **Runtime:** Node.js
*   **Package Manager:** npm

### Key Files

*   `package.json`: Defines project dependencies and scripts.
*   `tspconfig.yaml`: Configures the TypeSpec compiler and emitters.
*   `src/main.tsp`: The main entry point for the TypeSpec definition, which imports all the route definitions.
*   `src/routes/*.tsp`: Individual files defining the API routes.
*   `tsp-output/schema`: The output directory for the generated OpenAPI specification.

## Development Workflow

### Common Commands

*   **`npm run build`**: To compile the TypeSpec code and generate the OpenAPI specification.
*   **`npm run dev`**: To compile the TypeSpec code in watch mode for continuous development.

### General Instructions

1.  When adding a new API endpoint, create a new `.tsp` file in the `src/routes/` directory.
2.  Import the new route file in `src/main.tsp`.
3.  Run `npm run build` to ensure the changes are correctly compiled and the OpenAPI schema is updated.
