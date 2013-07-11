module Pardot
  
  class Client
    
    include HTTParty
    base_uri 'https://pi.pardot.com'
    format :xml
    
    include Authentication
    include Http

    include Objects::Campaigns
    include Objects::Lists
    include Objects::ListMemberships
    include Objects::Opportunities
    include Objects::Prospects
    include Objects::Users
    include Objects::Visitors
    include Objects::Visits
    include Objects::VisitorActivities
    
    attr_accessor :email, :password, :user_key, :api_key, :format
    
    def initialize email, password, user_key
      @email = email
      @password = password
      @user_key = user_key
      
      @format = "simple"
    end
    
    
  end
end
