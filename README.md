# seablast-actions

This curated collection of prefabricated GitHub Actions is designed to supercharge your PHP projects with reusable workflows.
Streamline your development process and ensure consistent build, test, and deployment practices across all your PHP applications.

Supports: "php": "5.6 || ^7.0 || ^8.0"

## Usage

Test composer dependencies, PHPUnit tests and PHPStan check
```yml
jobs:
  # Note: https://docs.github.com/en/actions/using-workflows/reusing-workflows The strategy property is not supported in any job that calls a reusable workflow.
  call-workflow:
    uses: WorkOfStan/seablast-actions/.github/workflows/php-composer-dependencies-reusable.yml@main
    with:
      # JSON
      php-version: '["7.2", "7.3", "7.4"]'
```

PHPUnit tests are triggered only if conf/phpunit-github.xml is present.

Basic PHP linter
```yml
jobs:
  # Note: https://docs.github.com/en/actions/using-workflows/reusing-workflows The strategy property is not supported in any job that calls a reusable workflow.
  call-workflow:
    uses: WorkOfStan/seablast-actions/.github/workflows/overtrue-phplint.yml@main
```

[Super-Linter](https://github.com/super-linter/super-linter) of many formats
```yml
jobs:
  # Note: https://docs.github.com/en/actions/using-workflows/reusing-workflows The strategy property is not supported in any job that calls a reusable workflow.
  call-workflow:
    uses: WorkOfStan/seablast-actions/.github/workflows/linter.yml@main
```

Automatic PHP improvements
```yml
jobs:
  # Note: https://docs.github.com/en/actions/using-workflows/reusing-workflows The strategy property is not supported in any job that calls a reusable workflow.
  call-workflow:
    uses: WorkOfStan/seablast-actions/.github/workflows/phpcbf.yml@main
```

## SHFMT notes
super-linter configuration in [linter.yml](./github/workflows/linter.yml) refering to <.github/linters/.shfmt>
```yml
SHELL_SHFMT_FILE_NAME: .shfmt
```
is ignored in the end, as the code doesn't use the configuration:
see <https://github.com/super-linter/super-linter/blob/main/lib/functions/linterCommands.sh> -> `LINTER_COMMANDS_ARRAY_SHELL_SHFMT=(shfmt -d)`

And the default is to use 1 TAB as indentations, while the coding standard used here expects 4 spaces, so SHALL_SHFMT validation is turned off.
