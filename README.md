## Description

Web resume builder with seamless deployment to AWS CloudFront, backed by Terraform. Users can opt for their own domain name and ACM certificate. The CI/CD pipeline for multi-environment deployment is implemented using GitHub Actions and Terraform Workspaces.

## Application Requirements

- [Node 14](https://nodejs.org/en/blog/release/v14.17.3)
- [yarn](https://classic.yarnpkg.com/lang/en/docs/install)

## How to Run Locally

1. Install the dependencies:
   ```shell
   $ yarn install
   ```
2. Start a development server:
    ```shell
    $ yarn serve
    ```

## Deployment Strategy

The backend infrastructure consists of two environments: `staging` and `prod`. The environment configurations are defined using Terraform workspaces, which are set by a GitHub Actions workflow:
    1. A `staging` deployment is triggered by opening a Pull Request against `main` branch.
    2. A `prod` deployment is triggered by pushing a commit into `main` branch, which occurs when a PR is merged.

This strategy allows for testing of new features by deploying changes to `staging` environment prior to merging the code into `main` branch.

## Infrastructure

The backend infrastructure for the application consists of an S3 bucket to store the source files and a CloudFront distribution. Additionally, users can opt for a custom domain (a pre-existing hosted zone is required).

< #TODO: add diagram >

## Infrastructure Cleanup

You can clean up the AWS infrastructure by using the Terraform Destroy workflow. When running, you can select an environment to destroy.
