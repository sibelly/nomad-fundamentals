# nomad-fundamentals

<p align="center" style="text-align:center;">
  <a href="https://nomadproject.io">
    <img alt="HashiCorp Nomad logo" src="https://github.com/sibelly/nomad-fundamentals/blob/main/.github/logo-hashicorp.svg?raw=true" width="500" />
  </a>
</p>

Basics about HashiCorp tool Nomad

# Install Nomad

To simplify the getting started experience, you can download a precompiled binary and run it on your machine locally.

Download here -> https://www.nomadproject.io/downloads

Get started -> https://learn.hashicorp.com/tutorials/nomad/get-started-install

# Nomad ui

``` nomad ui ALLOCATION_ID ```

Will open the address on the browser:

![nomad-ui](https://github.com/sibelly/nomad-fundamentals/blob/main/.github/nomad-ui.png?raw=true)

# Start Nomad

## Start the agent

``` sudo nomad agent -dev -bind 0.0.0.0 -log-level INFO ```

## Discover agent information

```nomad node status```
```nomad server members```

## Registered Nodes

``` nomad node status ```

# Run your first job

## Generate the sample job

``` $ nomad job init```

```Example job file written to example.nomad```

## Run

```nomad job run example.nomad```

## Job Specification

```shell
job
  \_ group
        \_ task
```