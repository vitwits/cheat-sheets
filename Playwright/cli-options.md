# Playwright CLI Cheat Sheet

This cheat sheet lists essential Playwright CLI commands for running tests, generating code, debugging, and more, in a concise Markdown format. For detailed help, use `npx playwright --help`.

## Installation

* `npx playwright install`: Install all supported browsers (Chromium, Firefox, WebKit).
* `npx playwright install [browser...]`: Install specific browsers, e.g., `npx playwright install chromium webkit`.
* `npx playwright install --with-deps`: Install browsers with system dependencies.
* `npx playwright uninstall`: Remove installed browsers.

## Running Tests

* `npx playwright test`: Run all tests in the project (configured in `playwright.config.ts/js`).
* `npx playwright test --headed`: Run tests in headed mode (visible browser windows).
* `npx playwright test --browser=<browser>`: Run tests in a specific browser (`chromium`, `firefox`, `webkit`, `all`), e.g., `npx playwright test --browser=firefox`.
* `npx playwright test --project=<project>`: Run tests for a specific project, e.g., `npx playwright test --project=chromium`.
* `npx playwright test -g <grep>`: Run tests matching a regular expression, e.g., `npx playwright test -g "cart"`.
* `npx playwright test --grep-invert <grep>`: Run tests not matching a regular expression, e.g., `npx playwright test --grep-invert manual`.
* `npx playwright test --last-failed`: Rerun only tests that failed in the last run.
* `npx playwright test --only-changed=<branch>`: Run tests in files changed compared to a Git branch, e.g., `npx playwright test --only-changed=main`.
* `npx playwright test --forbid-only`: Fail if `test.only` is used (useful for CI).
* `npx playwright test --repeat-each <N>`: Run each test N times, e.g., `npx playwright test --repeat-each=3`.
* `npx playwright test --retries <N>`: Retry failed tests N times, e.g., `npx playwright test --retries=2`.
* `npx playwright test --timeout <ms>`: Set maximum test timeout in milliseconds, e.g., `npx playwright test --timeout=60000`.
* `npx playwright test --workers <N>`: Set number of parallel workers, e.g., `npx playwright test --workers=4`.
* `npx playwright test --max-failures <N>` or `npx playwright test -x <N>`: Stop after N test failures, e.g., `npx playwright test --max-failures=5`.
* `npx playwright test --reporter <reporter>`: Use a reporter (`dot`, `line`, `list`, `json`, `junit`, `html`), e.g., `npx playwright test --reporter=html`.
* `npx playwright test --trace <mode>`: Enable tracing (`on`, `off`, `on-first-retry`, `on-all-retries`), e.g., `npx playwright test --trace=on`.
* `npx playwright test --screenshot <mode>`: Capture screenshots (`on`, `off`, `only-on-failure`), e.g., `npx playwright test --screenshot=only-on-failure`.
* `npx playwright test --full-page-screenshot`: Capture full-page screenshots (requires `--screenshot`).
* `npx playwright test --ui`: Run tests in UI mode for interactive debugging.
* `npx playwright test --debug`: Run tests with Playwright Inspector (sets `--timeout=0`, `--max-failures=1`, `--headed`, `--workers=1`).
* `npx playwright test --list`: List all tests without running them, e.g., `npx playwright test --list --reporter=json`.
* `npx playwright test --config <file>`: Use a custom configuration file, e.g., `npx playwright test -c custom.config.js`.
* `npx playwright test --shard <current/all>`: Run a specific shard of tests, e.g., `npx playwright test --shard=1/3`.
* `npx playwright test --fail-on-flaky-tests`: Fail the build if any tests are flaky (useful for CI).

## Code Generation

* `npx playwright codegen`: Start recording with an interactive UI.
* `npx playwright codegen <url>`: Record actions on a specific website, e.g., `npx playwright codegen https://playwright.dev`.
* `npx playwright codegen --target=<language>`: Generate code in a specific language (`javascript`, `typescript`, `python`, etc.), e.g., `npx playwright codegen --target=python`.
* `npx playwright codegen --save-storage=<file>`: Save cookies and localStorage to a file, e.g., `npx playwright codegen --save-storage=auth.json`.
* `npx playwright codegen --load-storage=<file>`: Load cookies and localStorage from a file, e.g., `npx playwright codegen --load-storage=auth.json`.
* `npx playwright codegen --device=<device>`: Emulate a specific device, e.g., `npx playwright codegen --device="iPhone 11"`.
* `npx playwright codegen --viewport-size=<width>,<height>`: Set viewport size, e.g., `npx playwright codegen --viewport-size=800,600`.
* `npx playwright codegen --color-scheme=<scheme>`: Emulate color scheme (`light`, `dark`), e.g., `npx playwright codegen --color-scheme=dark`.
* `npx playwright codegen --timezone=<timezone>`: Emulate timezone, e.g., `npx playwright codegen --timezone="Europe/Rome"`.
* `npx playwright codegen --geolocation=<lat>,<lon>`: Emulate geolocation, e.g., `npx playwright codegen --geolocation="41.890221,12.492348"`.
* `npx playwright codegen --lang=<language>`: Emulate browser language, e.g., `npx playwright codegen --lang="it-IT"`.

## Opening Pages

* `npx playwright open <url>`: Open a page in Chromium, e.g., `npx playwright open example.com`.
* `npx playwright wk <url>`: Open a page in WebKit (Safari emulation), e.g., `npx playwright wk example.com`.
* `npx playwright open --device=<device> <url>`: Emulate a device, e.g., `npx playwright open --device="iPhone 11" wikipedia.org`.
* `npx playwright open --viewport-size=<width>,<height> <url>`: Set viewport size, e.g., `npx playwright open --viewport-size=800,600 twitter.com`.
* `npx playwright open --color-scheme=<scheme> <url>`: Emulate color scheme, e.g., `npx playwright open --color-scheme=dark twitter.com`.
* `npx playwright open --timezone=<timezone> <url>`: Emulate timezone, e.g., `npx playwright open --timezone="Europe/Rome" maps.google.com`.
* `npx playwright open --geolocation=<lat>,<lon> <url>`: Emulate geolocation, e.g., `npx playwright open --geolocation="41.890221,12.492348" maps.google.com`.
* `npx playwright open --lang=<language> <url>`: Emulate browser language, e.g., `npx playwright open --lang="it-IT" maps.google.com`.
* `npx playwright open --load-storage=<file> <url>`: Load cookies and localStorage, e.g., `npx playwright open --load-storage=auth.json my.web.app`.

## Screenshots

* `npx playwright screenshot <url> <output>`: Capture a screenshot of a page, e.g., `npx playwright screenshot twitter.com twitter.png`.
* `npx playwright screenshot --device=<device> <url> <output>`: Emulate a device, e.g., `npx playwright screenshot --device="iPhone 11" twitter.com twitter-iphone.png`.
* `npx playwright screenshot --full-page <url> <output>`: Capture a full-page screenshot, e.g., `npx playwright screenshot --full-page en.wikipedia.org wiki-full.png`.
* `npx playwright screenshot --wait-for-timeout=<ms> <url> <output>`: Wait before capturing, e.g., `npx playwright screenshot --wait-for-timeout=3000 twitter.com twitter.png`.
* `npx playwright screenshot --color-scheme=<scheme> <url> <output>`: Emulate color scheme, e.g., `npx playwright screenshot --color-scheme=dark twitter.com twitter-dark.png`.

## Generating PDFs

* `npx playwright pdf <url> <output>`: Generate a PDF of a page (headless Chromium only), e.g., `npx playwright pdf https://en.wikipedia.org wiki.pdf`.

## Trace Viewer

* `npx playwright show-trace <trace-file>`: View a trace file, e.g., `npx playwright show-trace trace.zip`.
* `npx playwright show-trace <trace-dir>`: View a trace from a directory, e.g., `npx playwright show-trace trace/`.

## Interactive Test Selection

* `npx playwright-cli-select run`: Interactive CLI to select and run tests, suites, or tags (requires `npm install playwright-cli-select`).
* `npx playwright-cli-select run --specs`: Filter by spec files.
* `npx playwright-cli-select run --titles`: Filter by test titles.
* `npx playwright-cli-select run --tags`: Filter by tags.
* `npx playwright-cli-select run --last-failed`: Filter to last failed tests.
* `npx playwright-cli-select run --only-changed`: Filter to changed tests.
* `npx playwright-cli-select run --json-data-path=<path>`: Use a pre-generated JSON test list, e.g., `npx playwright-cli-select run --json-data-path=data/test-list.json`.
* `npx playwright-cli-select run --submit-focused`: Auto-select focused option with Enter.

## Help

* `npx playwright --help`: Show all available commands and options.
* `npx playwright <command> --help`: Show help for a specific command, e.g., `npx playwright screenshot --help`.

## Notes

* CLI options override settings in `playwright.config.ts/js`.
* For Python, use `python -m playwright` instead of `npx playwright`, e.g., `python -m playwright codegen`.
* Use environment variables (e.g., via `dotenv`) for custom arguments, as direct custom arguments are not supported.
* Combine `--ui` or `--debug` with Playwright Inspector or UI Mode for advanced debugging.