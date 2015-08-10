
exec { "apt-get update":
    command => "/usr/bin/apt-get update",
}

class { 'gvm' :
}

class { 'groovy' : 

}
