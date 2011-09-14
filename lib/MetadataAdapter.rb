require 'rubygems'
require 'httparty'
require 'cgi'
require 'json'

class MetadataAdapter
  include HTTParty
  
  format :json

  #utility
  def self.set_headers
    headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  end

  def self.root_url
    myUrl = ENV['sfdc_instance_url'].sub("{version}",ENV['sfdc_api_version'])
    @root_url = myUrl
  end
  
  #get a list of objects
  def self.list_objects
    MetadataAdapter.set_headers
    myQuery = MetadataAdapter.root_url+"sobjects/"
    puts myQuery
    get(myQuery)
  end
  
  #describe a single object
  def self.describe_object(name)
    MetadataAdapter.set_headers    
    myQuery = MetadataAdapter.root_url+"sobjects/" + name + "/describe"
    get(myQuery)
  end
  
  #add a bunch of data
  def self.mass_insert(name,qty)
    MetadataAdapter.set_headers
    headers 'Content-Type' => "application/json"
    #get the fields
    #TODO figure out what I need to add
    #HACK just using name right now.
    newObjects = Array.new
    i =0
    myQuery = MetadataAdapter.root_url+"sobjects/" + name + "/"
    while i < Integer(qty) do
      current = { :name => "My Name! #{i}" + (0...8).map{65.+(rand(25)).chr}.join }
      puts post(myQuery, { :body => current.to_json } );
      i = i + 1
    end
  end
  
  #simple query(name)
  def self.query_object(name)
    MetadataAdapter.set_headers
    myQuery = "SELECT Name, Id from "+name+" ORDER BY CreatedDate DESC LIMIT 100"
    get(MetadataAdapter.root_url+"query/?q=#{CGI::escape(myQuery)}")
  end
end
