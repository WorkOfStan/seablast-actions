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

## [0.2.3] - 2025-03-09

Uses super-linter:v7.2.1 which doesn't invoke composer.

### Added

- Dump GitHub Variables for debugging

### Fixed

- linter.yml uses: `super-linter/super-linter/slim@v7.2.1` (instead of `super-linter/super-linter@main`) as v7.3.0 has a bug - composer expects PHP extensions that are not installed within super-linter environment

## [0.2.2] - 2025-02-21

### Added

- chain jobs example

### Changed

- The cache name (key) is `phps-${{ runner.os }}-PHP${{ matrix.php-version }}-vendor-${{ hashFiles('**/composer.json') }}`

### Deprecated

- stop using [phpcbf.yml](.github/workflows/phpcbf.yml) and start using [PHPCS-Fix](https://github.com/WorkOfStan/phpcs-fix/blob/main/.github/workflows/phpcs-phpcbf.yml)

### Fixed

- `shell: bash` added where missing

## [0.2.1] - 2025-01-18

### Added

- show PHPStan version before analyzing
- runs-on input can change the runner for reusable workflows linter.yml, overtrue-phplint.yml and php-composer-dependencies-reusable.yml

### Fixed

- the reusable workflows linter.yml, overtrue-phplint.yml and php-composer-dependencies-reusable.yml fetch the latest changes even by a previous job to allow for job chaining

## [0.2] - 2024-11-16

### Added

- Check PHP syntax for each PHP version separately

### Changed

- php-composer-dependencies-reusable: phinx runs only after composer update (not just no-dev), so that phinx can be in require-dev section
- [prettier-fix](https://github.com/WorkOfStan/prettier-fix) included to fix all those `VALIDATE_something_PRETTIER` that are now crucial part of super-linter
- phpstan added with tools of shivammathur/setup-php@v2 is the latest one, which may not be supported (e.g. phpstan:2.0.1 fails php:7.2,7.3), so phpstan is now installed by `composer require --dev phpstan/phpstan-webmozart-assert`

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

[Unreleased]: https://github.com/WorkOfStan/seablast-actions/compare/v0.2.3...HEAD
[0.2.3]: https://github.com/WorkOfStan/seablast-actions/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/WorkOfStan/seablast-actions/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/WorkOfStan/seablast-actions/compare/v0.2...v0.2.1
[0.2]: https://github.com/WorkOfStan/seablast-actions/compare/v0.1.1...v0.2
[0.1.1]: https://github.com/WorkOfStan/seablast-actions/compare/v0.1...v0.1.1
[0.1]: https://github.com/WorkOfStan/seablast-actions/releases/tag/v0.1
