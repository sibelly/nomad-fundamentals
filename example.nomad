# There can only be a single job definition per file. This job is named
# "example" so it will create a job with the ID and Name "example".

# The "job" stanza is the top-most configuration option in the job
# specification. A job is a declarative specification of tasks that Nomad
# should run. Jobs have a globally unique name, one or many task groups, which
# are themselves collections of one or many tasks.
#
# For more information and examples on the "job" stanza, please see
# the online documentation at:
#
#     https://www.nomadproject.io/docs/job-specification/job
#
job "example" {

  type = "service"

  update {

    max_parallel = 1
    min_healthy_time = "10s"
    healthy_deadline = "3m"
    progress_deadline = "10m"
    auto_revert = false
    canary = 0
  }

  migrate {
    max_parallel = 1
    health_check = "checks"
    min_healthy_time = "10s"
    healthy_deadline = "5m"
  }

  group "cache" {
    count = 1

    network {
      port "db" {
        to = 6379
      }
    }

    service {
      name     = "redis-cache"
      tags     = ["global", "cache"]
      port     = "db"
      provider = "nomad"

    }

    restart {
      attempts = 2
      interval = "30m"
      delay = "15s"
      mode = "fail"
    }

    ephemeral_disk {
      size = 300
    }


    task "redis" {
      driver = "docker"

      config {
        image = "redis:7"
        ports = ["db"]
        auth_soft_fail = true
      }


      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
      }

    }
  }
}

