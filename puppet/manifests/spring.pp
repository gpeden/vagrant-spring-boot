
exec { "apt-get update":
    command => "/usr/bin/apt-get update",
}

class { 'gvm' :
  owner =>'vagrant',
  group => 'vagrant',
}

class { 'java' :

}

class { 'groovy' : 

}
