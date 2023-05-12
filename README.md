# Prometheus

This project perform deployment of the `Prometheus`.

## How to Install

```bash
bash deploy.sh deploy-prometheus
```

## Notes

* By defautlt AWX is installed with the follwing default configuration

* 1 - Observability Namespace: `monitoring`
* 2 - Prometheus Release Name: `prometheus-stack`
* 3 - Prometheus Configuration Folder: `${PWD}/prometheus`

To change default values:

```bash
bash deploy.sh deploy-prometheus "<OBSERVABILITY_ NAMESPACE>" "<PROMETHEUS_RELEASE_NAME>" "<PROMETHEUS_CONFIGURATION_FOLDER>"
```

## How to Uninstall

```bash
bash deploy.sh destroy-prometheus
```
