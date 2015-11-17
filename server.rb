#!/usr/bin/env ruby
require 'rubydns'
require 'logger'

# You might want to reset your DNS cache first:
# Mac OS X: https://support.apple.com/en-gb/HT202516

DNS_SERVER_IP = ''
LOGFILE_NAME = 'domains.log'

INTERFACES = [[:udp, "0.0.0.0", 53], [:tcp, "0.0.0.0", 53]]
Name = Resolv::DNS::Name
IN = Resolv::DNS::Resource::IN

raise "Please set DNS_SERVER_IP in server.rb!" if DNS_SERVER_IP == ''

UPSTREAM = RubyDNS::Resolver.new([[:udp, DNS_SERVER_IP, 53], [:tcp, DNS_SERVER_IP, 53]])

RubyDNS::run_server(:listen => INTERFACES) do

  match(//) do |transaction|
    transaction_domain = transaction.question.to_s

    log = Logger.new LOGFILE_NAME
    log.info transaction_domain

    transaction.passthrough!(UPSTREAM)
  end

end
