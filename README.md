# dns-logger
Transparent DNS Server that writes every Domain name to a logfile.

## Requirement

Please install the rubydns gem first:

```gem install rubydns```

## Set your DNS Server IP
Edit the server.rb file and add your DNS Server IP (look for the ```DNS_SERVER_IP``` constant!):

Example: ```DNS_SERVER_IP = '192.168.0.1'```

## Run the Server
It's required to run the Server as root since we need Port 53. If you don't want to run it as root, feel free to change the portnumber inside server.rb.

```sudo ruby server.rb```

View domains.log to see the result.
