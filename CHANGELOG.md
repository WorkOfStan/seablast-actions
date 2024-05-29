# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### `Added` for new features

### `Changed` for changes in existing functionality

### `Deprecated` for soon-to-be removed features

### `Removed` for now removed features

### `Fixed` for any bugfixes

### `Security` in case of vulnerabilities

## [0.1.1] - 2024-05-29
### Changed
- php-composer-dependencies-reusable: phinx and dist config file path can be modified

### Fixed
- linter.yml: DEFAULT_BRANCH adapts to the current branch. `actions/checkout with fetch-depth: 0` to fetch all history for all branches and tags to provide history with pull_request.

## [0.1] - 2024-05-19
Proven reusable workflows
### Added
- php-composer-dependencies-reusable.yml: Test composer dependencies, PHPUnit tests and PHPStan check
- overtrue-phplint.yml: Basic PHP linter
- linter.yml: [Super-Linter](https://github.com/super-linter/super-linter) of many formats
- Automatic PHP improvements: phpcbf.yml

### Fixed
- added .shfmt configuration for super-linter but VALIDATE_SHELL_SHFMT: false is the only solution, anyway

[Unreleased]: https://github.com/WorkOfStan/seablast-actions/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/WorkOfStan/seablast-actions/compare/v0.1...v0.1.1
[0.1]: https://github.com/WorkOfStan/seablast-actions/releases/tag/v0.1
