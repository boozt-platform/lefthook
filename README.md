[<img src="https://raw.githubusercontent.com/boozt-platform/branding/main/assets/img/platform-logo.png" width="350"/>][homepage]

[![GitHub Tag (latest SemVer)](https://img.shields.io/github/v/tag/boozt-platform/lefthook.svg?label=latest&sort=semver)][releases]
[![license](https://img.shields.io/badge/license-mit-brightgreen.svg)][license]

# lefthook

Various organizational hooks based on the [lefthook](https://github.com/evilmartians/lefthook) for development and continuous integration. Hooks enforce consistent practices across all commits and deployments. 

## Table of Contents

- [How to Use It](#how-to-use-it)
- [Available Hooks](#available-hooks)
- [About Boozt](#about-boozt)
- [Reporting Issues](#reporting-issues)
- [Contributing](#contributing)
- [License](#license)

## How to Use It

```yaml
remotes:
  - git_url: git@github.com:boozt-platform/lefthook
    ref: v1.2.0
    configs:
      # lint commit messages based by the conventional commits
      - hooks/commitlint/.lefthook.yaml
      # lint Dockerfiles
      - hooks/hadolint/.lefthook.yaml
      # lint shell scripts
      - hooks/shellcheck/.lefthook.yaml
      # check if the license headers are present in the files
      - hooks/license-checker/.lefthook.yaml
```

## Available Hooks

 - [commitlint](./hooks/commitlint/) (**commit-msg**) - Lint commit messages based by the conventional commits
 - [hadolint](./hooks/hadolint/) (**pre-commit**) - A smarter Dockerfile linter
 - [shellcheck](./hooks/shellcheck/) (**pre-commit**) - a static analysis tool for shell scripts
 - [license-checker](./hooks/license-checker/) (**pre-commit**) - Checks if the license headers are present in the Git staged files with possibility to exclude certain files or file extensions using Regular Expression pattern.

## About Boozt

Boozt is a leading and fast-growing Nordic technology company selling fashion and lifestyle online mainly through its multi-brand webstore [Boozt.com][boozt] and [Booztlet.com][booztlet].

The company is focused on using cutting-edge, in-house developed technology to curate the best possible customer experience.

With offices in Sweden, Denmark, Lithuania and Poland, we pride ourselves in having a diverse team, consisting of 1100+ employees and 38 nationalities.

See our [Medium][blog] blog page for technology-focused articles. Would you like to make your mark by working with us at Boozt? Take a look at our [latest hiring opportunities][careers].

## Reporting Issues

Please provide a clear and concise description of the problem or the feature you're missing along with any relevant context or screenshots.

Check existing issues before reporting to avoid duplicates.

Please follow the [Issue Reporting Guidelines][issues] before opening a new issue.

## Contributing

Contributions are highly valued and very welcome! For the process of reviewing changes, we use [Pull Requests][pull-request]. For a detailed information please follow the [Contribution Guidelines][contributing]

## License

[![license](https://img.shields.io/badge/license-mit-brightgreen.svg)][license]

This project is licensed under the MIT. Please see [LICENSE][license] for full details.

[homepage]: https://github.com/boozt-platform/lefthook
[releases]: https://github.com/boozt-platform/lefthook/releases
[issues]: https://github.com/boozt-platform/lefthook/issues
[pull-request]: https://github.com/boozt-platform/lefthook/pulls
[contributing]: ./docs/CONTRIBUTING.md
[license]: ./LICENSE
[boozt]: https://www.boozt.com/
[booztlet]: https://www.booztlet.com/
[blog]: https://medium.com/boozt-tech
[careers]: https://careers.booztgroup.com/
