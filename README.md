# seablast-actions

This curated collection of prefabricated GitHub Actions is designed to supercharge your PHP projects with reusable workflows.
Streamline your development process and ensure consistent build, test, and deployment practices across all your PHP applications.

Supports: "php": "5.6 || ^7.0 || ^8.0"

## Example

See <https://github.com/WorkOfStan/seablast-dist/tree/main/.github/workflows> for an actual example.

Note that there are two ways to chain jobs (as typically you want to lint a code only if it is actually working [not to waste computing time]).
One is to trigger workflows by running another workflow successfully first:

```yaml
on:
  workflow_run:
    workflows:
      - First Action
    types:
      - completed
```

but as this condition works **ONLY** on the default branch, and typically you need to run workflows on dev branches to make sure the code is working and well formatted,
there's the second way. Chaining jobs within a single workflow by using `needs` command.
See <https://github.com/WorkOfStan/seablast-dist/blob/main/.github/workflows/polish-the-code.yml> for an actual example.

## Test composer dependencies, PHPUnit tests (incl. database) and PHPStan check

```yml
jobs:
  # Note: https://docs.github.com/en/actions/using-workflows/reusing-workflows The strategy property is not supported in any job that calls a reusable workflow.
  call-workflow:
    uses: WorkOfStan/seablast-actions/.github/workflows/php-composer-dependencies-reusable.yml@main
    with:
      # REQUIRED JSON
      php-version: '["7.2", "7.3", "7.4"]'
      # OPTIONAL path with the default database configuration
      phinx-config: "phinx.dist.yml"
      # OPTIONAL path where the app code is looking for the database configuration
      phinxlocal-config: "phinx.yml"
      # OPTIONAL path to phpdist-config specimen which is used to create the actual phplocal-config
      phpdist-config: "./conf/app.conf.dist.php"
      # OPTIONAL path where the app code is looking for the local app configuration
      phplocal-config: "./conf/app.conf.local.php"
      # OPTIONAL runner specification
      runs-on: "ubuntu-latest"
```

PHPUnit tests fire up only if `conf/phpunit-github.xml` is present. (This configuration may be different from the usual `./phpunit.xml`.)

### Caching Mechanism

To optimize execution time, the `vendor` folder is cached, allowing dependencies to be reused across workflow runs. The cache key is generated based on:

- `composer.json` – to track dependency changes.
- The runner's OS and PHP version – to account for environment-specific variations.

This approach enables cache sharing across branches. However, if the code in the referenced branch (e.g., `dev`) changes, it's recommended to **invalidate the cache** to ensure a fresh `vendor` folder is built from scratch.

The cache name (key) is `phps-${{ runner.os }}-PHP${{ matrix.php-version }}-vendor-${{ hashFiles('**/composer.json') }}` (because the vendor folder includes PHPStan)

## Basic PHP linter

```yml
jobs:
  # Note: https://docs.github.com/en/actions/using-workflows/reusing-workflows The strategy property is not supported in any job that calls a reusable workflow.
  call-workflow:
    uses: WorkOfStan/seablast-actions/.github/workflows/overtrue-phplint.yml@main
    with:
      # OPTIONAL runner specification
      runs-on: "ubuntu-latest"
```

## [Super-Linter](https://github.com/super-linter/super-linter) of many formats

```yml
jobs:
  # Note: https://docs.github.com/en/actions/using-workflows/reusing-workflows The strategy property is not supported in any job that calls a reusable workflow.
  call-workflow:
    uses: WorkOfStan/seablast-actions/.github/workflows/linter.yml@main
    with:
      # OPTIONAL runner specification
      runs-on: "ubuntu-latest"
```

With the release of [Super-Linter](https://github.com/super-linter/super-linter) 7.0.0, [Prettier](https://prettier.io/) has become the standard for many file formats, ensuring consistent code styling across your projects.
Embrace this change and keep your codebase looking sharp by integrating Prettier directly into your workflow: [prettier-fix](https://github.com/marketplace/actions/prettier-fix).

Note: It's not possible to select super-linter version through a parameter, as the `uses` field expects a static string, so at least `super-linter/super-linter/slim@latest` (instead of `super-linter/super-linter@main`)
is used for sake of efficiency as these linters are not used in PHP anyway: Rustfmt, Rust Clippy, Azure Resource Manager Template Toolkit (arm-ttk), PSScriptAnalyzer, dotnet (.NET) commands and subcommands.

### SHFMT notes

Super-linter configuration in [linter.yml](./github/workflows/linter.yml) refering to [.github/linters/.shfmt](.github/linters/.shfmt)

```yml
SHELL_SHFMT_FILE_NAME: .shfmt
```

is ignored in the end, as the code doesn't use the configuration:
see <https://github.com/super-linter/super-linter/blob/main/lib/functions/linterCommands.sh> -> `LINTER_COMMANDS_ARRAY_SHELL_SHFMT=(shfmt -d)`

And the default is to use 1 TAB as indentations, while the coding standard used here expects 4 spaces, so SHALL_SHFMT validation is turned off.

## Automatic PHP Code Style improvements

Use [PHPCS-Fix](https://github.com/WorkOfStan/phpcs-fix/blob/main/.github/workflows/phpcs-phpcbf.yml).
