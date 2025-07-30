# rittman-assessment-joseph-orafu
Creating a repo to house dbt code for rittman assessment

# Overview

This repository includes all the re-usable modules for the Rittman Anaytics Assessment, in terms of transformations and documentation of the ingested and transformed data.

# Table of Contents

- [Repository structure](#repository-structure)
- [Contributing](#contributing)
    - [Branching Strategy](#branching-strategy)
    - [Working with Pre-Commit](#working-with-pre-commit)
        - [Working with SQLFluff](#working-with-sqlfluff)
        - [Working with YAMLLint](#working-with-yamllint)
    - [Pull Requests](#pull-requests)
    - [Code Review Checklist](#code-review-checklist)
    - [Pull Request Merge](#pull-request-merge)

# Repository Structure

```
├── README.md
├── analysis
├── macros
├── models
│   └── core
|   └── intermediate
│   └── staging
│   └── utils
├── snapshots
├── tests
```

The following table outlines purpose of the folders at the root level:
| Folder   | Purpose |
| -------- | ------- |
| analysis | The analysis folder lets you store any queries you want to use Jinja with and version control, but not build into models in your warehouse. |
| macros | For DRY-ing up transformations you find yourself doing repeatedly. |
| models | A SQL model is a select statement. Models are defined in .sql files. When you execute the dbt run command, dbt will build this model data warehouse by wrapping it in a create view as or create table as statement. |
| snapshots | For creating Type 2 slowly changing dimension records from Type 1 source data. |
| tests | For testing multiple specific tables simultaneously. |

# Contributing

## Branching Strategy

Dedicated Git branches should be used for all changes to the codebase. 
Always create your branch from the _main_ branch (which is the default branch in GitHub).

Your branch name should follow the convention:
```
[feature|bugfix]/a_concise_description
```

| Branch prefix | Purpose |
| ------------- | ------- |
| feature | These branches are used for developing new features. For example, feature/data_ingestion. |
| bugfix | These branches are used to fix bugs in the code. For example, bugfix/issue. |

## Working with Pre-Commit
- Pre-commit is configured to run various checks automatically when you attempt to push your code. I've overridden the default commit pattern to run on push to make committing small changes easier. When you attempt to push your code the pre-commit hooks will run, and if they pass, the push will succeed; if not there is some sort of issue that needs to be resolved before pushing your changes.
- Pre-commit will only run against changed files to keep its execution as quick as possible.
- On its first execution, pre-commit will install any dependencies it needs into a virtual environment (located outside of this repo); this may take a few minutes on its first run, but every following run will reuse that env and as a result will be much quicker.
- The following tools are installed and orchestrated with pre-commit.
 

### Working with SQLFluff
- SQLFluff is a dialect-flexible and configurable SQL linter. Designed with ELT applications in mind, SQLFluff also works with Jinja templating and dbt. SQLFluff will auto-fix most linting errors, allowing you to focus your time on what matters.
- SQLFluff lint is configured as a pre-commit hook that runs on push, so in most cases no explicit commands are needed. This will only list errors and will not fix any errors if found.
- If you would like to run SQLFluff lint manually, or would like to run it in fix mode, you can do so with the following commands which will run them through pre-commit.
```
pre-commit run --hook-stage push sqlfluff-lint --all-files
pre-commit run --hook-stage manual sqlfluff-fix --all-files
```
 

### Working with YAMLLint
- YAMLLint will automatically check our modified files to ensure that our YAML standards, as defined in our YAMLLint config, are upheld.
- YAMLLint is configured as a pre-commit, so in most cases no explicit commands are needed. This will only list errors and will not fix any errors if found.
- If you would like to run YAMLLint manually, you can do so with the following command which will run it through pre-commit.
```
pre-commit run --hook-stage push yamllint
```

### Working with direnv

- Direnv will allow you to set environment variables in your shell
- This means that you can make use of the profiles.yml file in `/local_config/` to configure your local dev environment.

Create your `.envrc` file

```sh
# Copy the sample file to .envrc
cp .envrc.example .envrc
# Then manually fill in the variables required, including your developer name
```

Now, you can use `direnv` to automatically export these variables for you when you are within the repo in any terminal.

Then:

```sh
# Activate direnv 
direnv allow
```

This should now automatically use your `.envrc` file to export the shell variables.

Next run:
```sh
# Test DBT connection
dbt debug
```

To verify connection to BigQuery

## Pull Requests

When development and testing is completed on your branch, all code changes are committed and pass pre-commit hooks.
Push the commits to the remote repository and raise a Pull Request (PR) in GitHub.

The PR should be configured to be merged into the _main_branch (which is the default).

A [Pull Request Template](.github/pull_request_template.md) has been created that includes instructions for what should go into your PR and guidelines.

## Code Review Checklist

When a code review has been requested as part of a raised PR, please keep the following guidelines and questions in mind:

- Read through the PR description and relevant JIRA ticket to get an understanding of what the PR aims to achieve
- Is the code well structured and well formatted?
- Does the code include comments and other sorts of documentation where necessary?
- Is the code maintainable easily?
- Does it contain a lot of duplicated code that could be refactored?
- Are the code changes covered by unit tests where necessary?

## Pull Request Merge

When a PR has been approved, complete the following steps as a best practice:

- Use the _Squash and merge_ method to merge the PR to the _main_ branch
- Use a descriptive commit message in the imperative: "Add X" rather than "Added X" or "Adds X"
- Let relevant members of the team know your changes have been merged into _main_ branch
- Make sure that triggered workflows like CI/CD run to completion successfully
- Delete the local branch that the PR was based on
- Remember to pull down the new commits to your local _main_ branch and rebase with relevant feature/bugfix branches
