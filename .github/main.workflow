# workflow "New workflow" {
#   on = "push"
#   resolves = ["Push"]
# }

# action "Login" {
#   uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
#   env = {
#     DOCKER_REGISTRY_URL = "docker.pkg.github.com"
#     DOCKER_USERNAME = "adamlacombe"
#   }
#   secrets = ["DOCKER_PASSWORD"]
# }

# action "Build" {
#   uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
#   args = "build -t docker.pkg.github.com/adamlacombe/docker-gitkraken/docker-gitkraken ."
#   needs = ["Login"]
# }

# action "Push" {
#   uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
#   needs = ["Build"]
#   args = "push docker.pkg.github.com/adamlacombe/docker-gitkraken/docker-gitkraken"
# }
