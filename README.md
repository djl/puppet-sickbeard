# sickbeard

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with sickbeard](#setup)
    * [What sickbeard affects](#what-sickbeard-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with sickbeard](#beginning-with-sickbeard)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)

## Overview

Install sickbeard

## Module Description

Installs sickbeard via git, sets up sensible defaults and configures
the service to start at boot.

## Setup

### What sickbeard affects

* Checks out sickbeard from git
* Creates an init script
* Creates defaults under `/etc/{default,sysconfig}/sickbeard`


### Beginning with sickbeard

If you just want sickbeard installed with the default options:

    class { 'sickbeard': }
    # or
    include ::sickbeard

## Usage

All interaction for sickbeard is done via the `sickbeard` class

## Reference

### Classes

##### Public classes
* `sickbeard`: Installs and configures the sickbeard service

#### Private classes:
* `sickbeard::config`: Sets up the default options for sickbeard (`/etc/default/sickbeard`)
* `sickbeard::install`: Installs sickbeard
* `sickbeard::service`: Configures the sickbeard service
