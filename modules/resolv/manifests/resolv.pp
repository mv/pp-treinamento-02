# simple template

class resolv {
	
	$searchpath = "abril.com.br, abrdigital.com.br"
	$nameservers = ["172.16.0.1", "172.16.0.2"]

	file { "resolv.conf":
		name    => "/tmp/resolv.conf",
		content => template("resolv/resolv.conf.erb")
	}

}


# vim:ft=puppet:

