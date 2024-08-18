# Postman Collection Runner

This GitHub Action runs Postman collections using Newman.

## Inputs

- `collection`: Path to the Postman collection file (required)
- `environment`: Path to the Postman environment file (optional)
- `report-file`: Path to the output JUnit report file (required)

## Example Usage

```yaml
name: Run API Tests

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Run Postman Collection
        uses: your-username/postman_collection_runner@v1
        with:
          collection: './path/to/collection.json'
          environment: './path/to/environment.json'
          report-file: './path/to/results.xml'
