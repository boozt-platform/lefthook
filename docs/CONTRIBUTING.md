<!--
SPDX-FileCopyrightText: Copyright Boozt Fashion, AB
SPDX-License-Identifier: MIT
-->

# Contributing Guidelines

Thank you for considering contributing to our project! Your contributions are highly valued and help improve the project for everyone. To make the contribution process as smooth as possible, please follow the guidelines outlined below:

1. [Opening a GitHub Issue](#opening-a-github-issue)
1. [Forking the Repository](#forking-the-repository)
1. [Updating Documentation](#updating-documentation)
1. [Updating Tests](#updating-tests)
1. [Updating Code](#updating-code)
1. [Creating a Pull Request](#creating-a-pull-request)
1. [License Information](#license-information)
1. [Merging and Releasing](#merging-and-releasing)

## Opening a GitHub Issue

If you encounter a bug, have a feature request (please note that we want to avoid [feature creep][feature-creep] and we cannot guarantee your request will be accepted), or wish to suggest an improvement, please open a GitHub issue and ask the [CODEOWNERS][codeowners] and community prior starting a contribution. Provide a clear and concise description of the problem or suggestion, including any relevant details or context. This will help us understand and address the issue efficiently.

## Forking the Repository

To contribute to the project, fork the repository on GitHub and create a new branch as described in the [GitHub Flow][github-flow]. This will create a copy of the project in your GitHub account where you can make changes without affecting the original repository.

## Updating Documentation

Documentation is crucial for understanding and using the project effectively. If you make changes to the code, please ensure that any relevant documentation is updated accordingly. This includes README files, code comments, and any other documentation files.

Please follow [Readme Driven Development][rdd].

## Updating Tests

Maintaining a robust test suite is essential for ensuring the reliability and stability of the project.

If you make changes to the code, please update any relevant tests to reflect those changes. This helps
prevent regressions and ensures that the project continues to function as expected (see [TDD][tdd]).

The test folder (if provided) in repository will have documentation guideline how to run the tests.

## Updating Code

Ensure to make your changes to the codebase and [commit][commit-and-review] messages early and often, following the standards outlined in the project's README.md or CONTRIBUTING.md file. Use [conventional commits][conventional-commits] for commit messages, adhering to one of the following patterns:

 - `<type>[optional scope]: <description> [optional body] [optional footer(s)]`
 - `<type>[optional scope]: <subject>`

Refer to the table below for the possible commit types:

| Type | Description|
| ---- | ---- |
| build | Changes affecting the build system or dependencies (example scopes: gulp, npm)
| chore | Maintenance tasks such as upgrades or cleanup |
| ci | Changes to CI configuration files or scripts (example scopes: Travis, Circle, GitLab, GitHub) |
| docs | Documentation-only changes |
| feat | New features |
| fix | Bug fixes |
| perf | Performance improvements |
| refactor | Code changes that don't fix bugs or add features |
| revert | Reverting a previous commit |
| style | Changes to code style or formatting |
| test | Adding or correcting tests |

Exclamation mark (!) is optional and can be used to indicate breaking changes. Use it before colon (:). i.e. `feat(auth)!: add login feature`.

For comprehensive documentation, [click here][conventional-commits].

If a backwards incompatible change is unavoidable, ensure to mention it in your pull request and provide justification for the necessity of the change.

## Creating a Pull Request

Once you've made your changes and are ready to contribute them back to the project, [create a pull request (PR)][pr]. Provide a clear and descriptive title for your PR, along with a summary of the changes made, any related GitHub issues and any notes on backwards incompatibility.

Be sure to follow the pull request template, if one is provided.

## License Information

To ensure proper attribution and compliance with licensing terms, we require that all source code files include a [short-form SPDX ID][spdx-license-info] license comment block. This block should be added at the top of each source code file. 

```
SPDX-FileCopyrightText: Copyright Boozt Fashion, AB
SPDX-License-Identifier: MIT
```

For more information of the SPDX file tags please follow https://spdx.github.io/spdx-spec/v2.3/file-tags/.

## Merging and Releasing

After your pull request has been reviewed and approved by the project maintainers ([CODEOWNERS][codeowners]), it will be merged into the main branch. Once merged, the changes will be included in the next release of the project and the [Semantic Versioning (SemVer)][semver] principles will be applied. You'll be asked for squash your commits if it's not following the standards of the [conventional commits][conventional-commits].

**Thank you for your contribution!**

[feature-creep]: https://en.wikipedia.org/wiki/Feature_creep
[codeowners]: https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners
[github-flow]: https://docs.github.com/en/get-started/using-github/github-flow
[rdd]: https://tom.preston-werner.com/2010/08/23/readme-driven-development.html
[tdd]: https://en.wikipedia.org/wiki/Test-driven_development
[commit-and-review]: https://docs.github.com/en/desktop/making-changes-in-a-branch/committing-and-reviewing-changes-to-your-project-in-github-desktop
[conventional-commits]: https://www.conventionalcommits.org/en/v1.0.0/
[pr]: https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request
[semver]: https://semver.org/
[spdx-license-info]: https://spdx.dev/learn/handling-license-info/
