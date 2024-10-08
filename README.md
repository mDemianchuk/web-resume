## Description

Web resume builder with seamless deployment to AWS CloudFront, backed by Terraform. Users can opt-in for their own domain name and ACM certificate. Additionally, users can choose to be notified when application errors occur. The CI/CD pipeline for multi-environment deployment is implemented using GitHub Actions and Terraform Workspaces.

## Application Requirements

- [Node 14](https://nodejs.org/en/blog/release/v14.17.3)
- [yarn](https://classic.yarnpkg.com/lang/en/docs/install)

## How to Run Locally

1. Install the dependencies:
   ```shell
   yarn install
   ```
2. Start a development server:
    ```shell
    yarn serve
    ```

## Deployment Strategy

The backend infrastructure has two environments: `staging` and `prod`. To limit the cloud infrastructure to a single AWS account, the environments are represented by two AWS Regions:

1. A `staging` ([`test-resume.nickdemianchuk.com`](https://test-resume.nickdemianchuk.com) / `us-east-2`) deployment is triggered [by opening a Pull Request against `main` branch](https://github.com/mDemianchuk/web-resume/blob/main/.github/workflows/deploy.yml#L71-L72).

2. A `prod` ([`resume.nickdemianchuk.com`](https://resume.nickdemianchuk.com) / `us-east-1`) deployment is triggered [by pushing a commit into `main` branch](https://github.com/mDemianchuk/web-resume/blob/main/.github/workflows/deploy.yml#L73-L74), which occurs when a PR is merged.

This strategy allows for testing of new features by deploying changes to `staging` environment prior to merging the code into `main`.

## Infrastructure

The backend infrastructure for the application consists of an S3 bucket for the source files and a CloudFront distribution. Additionally, users can opt in for a custom domain and ACM certificate (a pre-existing hosted zone is required).

![AWS Infrastructure](infra_diagram.png)

## Infrastructure Cleanup

You can clean up the AWS infrastructure by using the [Terraform Destroy workflow](https://github.com/mDemianchuk/web-resume/actions/workflows/destroy.yml). When running, you can [select an environment](https://github.com/mDemianchuk/web-resume/blob/main/.github/workflows/destroy.yml#L5-L12) to destroy.
