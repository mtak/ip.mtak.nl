ip.mtak.nl
==========
Note: this code is currently used on ip.mtak.nl and provided for your reference, so no pull requests for generic functionality will be merged.

This page will return the IP address of the client requesting the IP address. This will work for both IPv4 and IPv6 addresses.

There is also an API version available which only returns the IP address (no other HTML). When you request the page using one of the following User-Agent headers you will automatically get the API version:

    m/curl/i
    m/wget/i
    m/lynx/i
    m/emacs/i
    m/links/i

You can also explicitly request the API version by requesting http://example.com/api/ (works with symlink in /api) directory.

Installation
==
* Clone the repository
* Create a virtual host (Apache2):
```
<VirtualHost *:80>
	ServerName ip.mtak.nl
	ServerAlias ip4.mtak.nl
	ServerAlias ipv4.mtak.nl
	ServerAlias ip6.mtak.nl
	DocumentRoot /path/to/ip.mtak.nl

	<Directory /path/to/ip.mtak.nl>
		Options +ExecCGI
		AllowOverride None
		Order deny,allow
		Allow from all
	</Directory>
</VirtualHost>
```
* Add index.pl to the Apache2 DirectoryIndex directive
```
DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm
```
* Make the script executable:
```
chmod 755 /path/to/index.pl
```
* Profit!


