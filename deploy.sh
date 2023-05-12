set -eo pipefail

if [ ! -d "$PWD/built-library" ]; then
  git clone --single-branch --branch v1 https://github.com/leandromoreirati/built-library.git "$PWD/built-library"
fi

__BUILD_TOOLS_PATH="./built-library"

LOG_FILE="$PWD/cluster.log"

rm -f $LOG_FILE

source "$__BUILD_TOOLS_PATH/scripts/log.sh"
source "$__BUILD_TOOLS_PATH/scripts/shell_overrides.sh"
source "$__BUILD_TOOLS_PATH/scripts/prometheus.sh"

f_prometheus() {
  #$1 - Observability Namespace
  #$2 - Prometheus Release Name
  #$3 - Prometheus Configuration Folder
  prometheus_install "monitoring" "prometheus-stack" "${PWD}/prometheus"
}

f_destroy_prometheus() {
  #$1 - Observability Namespace
  #$2 - Prometheus Release Name
  prometheus_uninstall "monitoring" "prometheus-stack"
}

f_clean() {
  rm -rfv terraform/.terraform* terraform/terraform*  terraform/tfplan*
}

case "$1" in
  deploy-prometheus)
    f_prometheus
  ;;

  destroy-prometheus)
    f_destroy_prometheus
  ;;

  *)
    echo "usage: build.sh deploy-prometheus|destroy-prometheus|clean"
    exit 0
  ;;

esac