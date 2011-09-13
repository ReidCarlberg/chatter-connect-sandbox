require 'rubygems'
require 'httparty'
require 'cgi'

class AccountAdapter
  include HTTParty
  
  format :json
  
  def self.set_headers
    headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  end

  def self.root_url
    @root_url = ENV['sfdc_instance_url'].sub("{version}",ENV['sfdc_api_version'])
  end

  def self.get_first_hundred
    AccountAdapter.set_headers
    get(AccountAdapter.root_url+"query/?q=#{CGI::escape('SELECT Name, Id from Account LIMIT 100')}")
  end  
  
end
