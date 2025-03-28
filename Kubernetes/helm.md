# Helm Cheat Sheet

## Getting Started

* `helm version`: Check the Helm client and server versions.
* `helm create NAME`: Create a new chart with the given name.
* `helm pull REPO/NAME [--version VERSION]`: Download a chart from a repository.
* `helm search REPO/NAME`: Search for charts in configured repositories.
* `helm show chart REPO/NAME [--version VERSION]`: Inspect a chart's metadata.
* `helm show values REPO/NAME [--version VERSION]`: Inspect a chart's default values.
* `helm repo add NAME URL`: Add a chart repository.
* `helm repo list`: List configured chart repositories.
* `helm repo update`: Update information of available charts from the chart repositories.

## Installing & Managing Releases

* `helm install [RELEASE_NAME] CHART`: Install a chart. `CHART` can be a chart reference, a path to a packaged chart, or a URL. If `RELEASE_NAME` is omitted, Helm will generate one.
* `helm upgrade RELEASE_NAME CHART [--version VERSION] -f VALUES_FILE`: Upgrade a release using a chart and optionally a values file.
* `helm uninstall RELEASE_NAME`: Uninstall a release.
* `helm list [-n NAMESPACE] [-a]`: List all releases in the current or specified namespace (`-n`), or all namespaces (`-a`).
* `helm status RELEASE_NAME`: Display the status of a named release.
* `helm history RELEASE_NAME`: View the revision history of a named release.
* `helm rollback RELEASE_NAME [REVISION]`: Roll back a release to a previous revision.

## Working with Values

* `-f VALUES_FILE` or `--values VALUES_FILE`: Specify a YAML file containing values to override the chart's defaults. Can be used with `install` and `upgrade`.
* `--set KEY=VALUE[,KEY=VALUE]`: Set individual values on the command line. Can be used with `install` and `upgrade`.
* `helm get values RELEASE_NAME [-n NAMESPACE]`: Get the values currently used by a release.
* `helm template [RELEASE_NAME] CHART -f VALUES_FILE`: Locally render templates. Useful for debugging and seeing what Kubernetes manifests Helm would generate.

## Chart Development & Packaging

* `helm package CHART_PATH`: Package a chart into a `.tgz` file.
* `helm lint CHART_PATH`: Examine a chart for potential issues.
* `helm push CHART_FILE REPO`: Push a packaged chart to a chart repository (requires a configured repository with push capabilities).

## Advanced

* `helm dependency build CHART_PATH`: Build the dependencies for a chart.
* `helm plugin list`: List installed Helm plugins.
* `helm plugin install PATH|URL`: Install a Helm plugin.
* `helm plugin uninstall NAME`: Uninstall a Helm plugin.

**Key Concepts:**

* **`Chart:`** A package containing all the necessary resource definitions to run an application, tool, or service within a Kubernetes cluster.
* **`Release:`** An instance of a chart running in a Kubernetes cluster. A single chart can be installed multiple times, creating multiple releases.
* **`Repository:`** A hosted collection of packaged charts.
* **`Values:`** Configuration parameters for a chart that can be overridden during installation or upgrade.
* **`Templates:`** Kubernetes manifest files within a chart that use Go template syntax to inject configuration values.

**Remember:** This is a quick reference. For detailed information and more options, always refer to the official Helm documentation: [https://helm.sh/docs/](https://helm.sh/docs/)