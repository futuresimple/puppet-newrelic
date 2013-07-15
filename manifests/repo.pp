class newrelic::repo {
  case $::osfamily {
    'Debian': {
      class {'newrelic::repo::apt': }
    }
  }
}
