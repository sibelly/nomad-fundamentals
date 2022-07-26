# nomad-fundamentals

<p align="center" style="text-align:center;">
  <a href="https://nomadproject.io">
    <img alt="HashiCorp Nomad logo" src="https://github.com/sibelly/nomad-fundamentals/blob/main/.github/logo-hashicorp.svg?raw=true" width="500" />
  </a>
</p>

Basics about HashiCorp tool Nomad

# Install Nomad

To simplify the getting started experience, you can download a precompiled binary and run it on your machine locally.

[Download HERE](https://www.nomadproject.io/downloads)

[Get Started](https://learn.hashicorp.com/tutorials/nomad/get-started-install)

#
# Start Nomad

## Start the agent

``` shell
$ sudo nomad agent -dev -bind 0.0.0.0 -log-level INFO
```

## Discover agent information

``` shell
$ nomad node status
$ nomad server members
```

## Registered Nodes

``` shell
$ nomad node status
```

# Run your first job

## Generate the sample job

``` shell
$ nomad job init
Example job file written to example.nomad
```

## Run

```shell
$ nomad job run example.nomad
```

## Job Specification

```shell
job
  \_ group
        \_ task
```

# Nomad ui

``` shell
$ nomad ui ALLOCATION_ID
```

Will open the address on the browser:

![nomad-ui](https://github.com/sibelly/nomad-fundamentals/blob/main/.github/nomad-ui.png?raw=true)