class newrelic::repo::apt(
 $pin = undef, 
){

  Class['newrelic::repo::apt'] ~> Package['newrelic-sysmond']

  apt::source { 'newrelic':
    location    => 'http://apt.newrelic.com/debian/',
    release     => 'newrelic',
    repos       => 'non-free',
    include_src => false,
    key         => '548C16BF',
    key_source  => 'http://download.newrelic.com/548C16BF.gpg', 
    pin         => $pin,
  }

  if ! ($pin == undef) {
    validate_re($pin, '\d\d\d')
    apt::pin { 'rabbitmq':
      packages => 'rabbitmq-server',
      priority => $pin,
    }
  }

}
