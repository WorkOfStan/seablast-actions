# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### `Added` for new features

- `validate-biome: true` optional parameter enable [Biome](https://biomejs.dev/) validation added to super-linter v8.2.0

### `Changed` for changes in existing functionality

-  super-linter bumped to v8.2.0

### `Deprecated` for soon-to-be removed features

### `Removed` for now removed features

### `Fixed` for any bugfixes

### `Security` in case of vulnerabilities

## [0.2.5.2] - 2025-09-26

feat: phinx migration verbose (in php-composer-dependencies-reusable.yml)

## [0.2.5.1] - 2025-09-07

### Added

feat: If there's no `.github/linters/zizmor.yaml` present in the app repository, then this GitHub Action auto-generates such [zizmor.yaml](.github/linters/zizmor.yaml) to disable unpinned-uses check. (Not to force all apps to create a one purpose zizmor.yaml.)

## [0.2.5] - 2025-08-28

feat: super-linter fixes can be downloaded as an artifact.

### Changed

- feat: super-linter slim version (linter.yml) moved from v7.2.1 to v8.1.0
  - [zizmor.yaml](.github/linters/zizmor.yaml) disables the unpinned-uses check - i.e. allows refering to version instead of an exact hash
  - many FIXes are applied automatically and their result can be downloaded as an artifact and then use locally with `git apply lint-fixes.patch`
  - removed: `JAVASCRIPT_ES_CONFIG_FILE: .eslintrc.yml`
  - `VALIDATE_JAVASCRIPT_ES: false` linter configuration because Prettier is applied anyway and I don't want to have `.eslintrc.yml` configured
  - `validate-css: false` optional parameter disable CSS validation
  - `filter-regex-exclude: ""` optional parameter for regular expression to exclude certain files, e.g. third-party code, from being linted
- chore: bump actions/checkout@v4 to v5
- chore: Bash coding standard uses TAB and not SPACEs

### Fixed

- linter.yml: Temporarily rename composer.json (and then back) to prevent invoking composer within super-linter, as the environment PHP version (which might not be app relevant) is used and various libraries would be expected that are not part of super-linter environment.

## [0.2.4] - 2025-07-05

### Fixed

fix: `git pull origin` doesn't work with `refs/pull/*`

## [0.2.3] - 2025-03-09

fix: uses super-linter:v7.2.1 which doesn't invoke composer.

### Added

- Dump GitHub Variables for debugging

### Fixed

- linter.yml uses: `super-linter/super-linter/slim@v7.2.1` (instead of `super-linter/super-linter@main`) as v7.3.0 has a bug - composer expects PHP extensions that are not installed within super-linter environment

## [0.2.2] - 2025-02-21

chore: The cache name starts with `phps-` prefix. PHPCS-fix instead of old phpcbf.

### Added

- chain jobs example

### Changed

- The cache name (key) is `phps-${{ runner.os }}-PHP${{ matrix.php-version }}-vendor-${{ hashFiles('**/composer.json') }}`

### Deprecated

- stop using [phpcbf.yml](.github/workflows/phpcbf.yml) and start using [PHPCS-Fix](https://github.com/WorkOfStan/phpcs-fix/blob/main/.github/workflows/phpcs-phpcbf.yml)

### Fixed

- `shell: bash` added where missing

## [0.2.1] - 2025-01-18

fix: Fetch the latest changes to allow job chaining.

### Added

- show PHPStan version before analyzing
- runs-on input can change the runner for reusable workflows linter.yml, overtrue-phplint.yml and php-composer-dependencies-reusable.yml

### Fixed

- the reusable workflows linter.yml, overtrue-phplint.yml and php-composer-dependencies-reusable.yml fetch the latest changes even by a previous job to allow for job chaining

## [0.2] - 2024-11-16

feat: Check PHP syntax and install PHPStan for each PHP version separately.

### Added

- Check PHP syntax for each PHP version separately

### Changed

- php-composer-dependencies-reusable: phinx runs only after composer update (not just no-dev), so that phinx can be in require-dev section
- [prettier-fix](https://github.com/WorkOfStan/prettier-fix) included to fix all those `VALIDATE_something_PRETTIER` that are now crucial part of super-linter
- phpstan added with tools of shivammathur/setup-php@v2 is the latest one, which may not be supported (e.g. phpstan:2.0.1 fails php:7.2,7.3), so phpstan is now installed by `composer require --dev phpstan/phpstan-webmozart-assert`

## [0.1.1] - 2024-05-29

fix: Super-linter adapts to the current branch. Phinx and dist config file paths can be modified.

### Changed

- php-composer-dependencies-reusable: phinx and dist config file path can be modified

### Fixed

- linter.yml: DEFAULT_BRANCH adapts to the current branch. `actions/checkout with fetch-depth: 0` to fetch all history for all branches and tags to provide history with pull_request.

## [0.1] - 2024-05-19

feat: Proven reusable workflows

### Added

- php-composer-dependencies-reusable.yml: Test composer dependencies, PHPUnit tests and PHPStan check
- overtrue-phplint.yml: Basic PHP linter
- linter.yml: [Super-Linter](https://github.com/super-linter/super-linter) of many formats
- Automatic PHP improvements: phpcbf.yml

### Fixed

- added .shfmt configuration for super-linter but VALIDATE_SHELL_SHFMT: false is the only solution, anyway

[Unreleased]: https://github.com/WorkOfStan/seablast-actions/compare/v0.2.5.2...HEAD
[0.2.5.2]: https://github.com/WorkOfStan/seablast-actions/compare/v0.2.5.1...v0.2.5.2
[0.2.5.1]: https://github.com/WorkOfStan/seablast-actions/compare/v0.2.5...v0.2.5.1
[0.2.5]: https://github.com/WorkOfStan/seablast-actions/compare/v0.2.4...v0.2.5
[0.2.4]: https://github.com/WorkOfStan/seablast-actions/compare/v0.2.3...v0.2.4
[0.2.3]: https://github.com/WorkOfStan/seablast-actions/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/WorkOfStan/seablast-actions/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/WorkOfStan/seablast-actions/compare/v0.2...v0.2.1
[0.2]: https://github.com/WorkOfStan/seablast-actions/compare/v0.1.1...v0.2
[0.1.1]: https://github.com/WorkOfStan/seablast-actions/compare/v0.1...v0.1.1
[0.1]: https://github.com/WorkOfStan/seablast-actions/releases/tag/v0.1
