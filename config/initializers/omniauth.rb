Rails.application.config.middleware.use OmniAuth::Builder do
    #basic omniauth config
    #add variables Client Key, Secret and URI as evironmental variables locally
    #comments here will show up in your logs when the app initializes
    #note: client options are based on my MBP which seems to have the common problem of Rails server not seeing a CRT file
    #this is not an issues in production
  
    puts "************HELLO LOGS! Reid's Rails Playground."
    puts "Production? ", Rails.env.production?
    puts "Client ", ENV['SALESFORCE_OAUTH2_KEY']
    puts "secret ", ENV['SALESFORCE_OAUTH2_SECRET']
    puts "URI ", ENV['SALESFORCE_OAUTH2_URI']
    
    
    if Rails.env.production?
      puts "**************production"
      provider :salesforce, 
        ENV['SALESFORCE_OAUTH2_KEY'], 
        ENV['SALESFORCE_OAUTH2_SECRET'],
        { :redirect_uri => ENV['SALESFORCE_OAUTH2_URI']}
    else
      puts "*************developer"
      provider :salesforce, 
        ENV['SALESFORCE_OAUTH2_KEY'], 
        ENV['SALESFORCE_OAUTH2_SECRET'],
        { :client_options => {
           :ssl => { :ca_file => "/usr/share/curl/curl-ca-bundle.crt" } 
          } }
        { :redirect_uri => ENV['SALESFORCE_OAUTH2_URI']}      
    end
    
end