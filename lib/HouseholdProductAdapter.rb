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

  def self.get_all_products(userId)
    HouseholdProductAdapter.set_headers
    myQuery = "SELECT Name, Id, Premium__c, Start_Date__c, End_Date__c, Description__c from Household_Product__c Where Account__r.User__c = '"+ userId +"' Order By End_Date__c DESC LIMIT 100"
    puts myQuery
    get(HouseholdProductAdapter.root_url+"query/?q=#{CGI::escape(myQuery)}")
  end  
  
end