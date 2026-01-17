bat() {
  /usr/bin/batcat ${1}
}   

dtags() {
  # get tags of docker images on dockerhub
  local image="${1}"
  curl --silent "https://registry.hub.docker.com/v2/repositories/library/${image}/tags?page_size=1000" | jq -r ".results[].name" | sort --version-sort
}   

path() {
  echo -e ${PATH//:/\\n}
}   

