require 'rubygems'
require 'httparty'
require 'cgi'

class HouseholdProductAdapter
  include HTTParty
  
  format :json
  
  def self.set_headers
    headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  end

  def self.root_url
    @root_url = ENV['sfdc_instance_url'].sub("{version}",ENV['sfdc_api_version'])
  end

  def self.get_all_products
    HouseholdProductAdapter.set_headers
    get(HouseholdProductAdapter.root_url+"query/?q=#{CGI::escape('SELECT Name, Id, Premium__c, StartDate__c, EndDate__c, Description__c from Household_Product__c Where Account__r.User__c = "+session['user_info']['id'] +" Order By EndDate__c DESC LIMIT 100')}")
  end  
  
end