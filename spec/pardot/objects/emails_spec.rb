require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Pardot::Objects::Emails do
  
  before do
    @client = create_client
  end
  
  describe "query" do
    
    def sample_results
      %(<?xml version="1.0" encoding="UTF-8"?>\n<rsp stat="ok" version="1.0">
        <result>
          <total_results>2</total_results>
          <email>
            <name>Announcement 1</name>
            <subject>Confirm your identify</subject>
          </email>
          <email>
            <name>Announcement 2</name>
            <subject>Welcome to GA</subject>
          </email>
        </result>
      </rsp>)
    end
    
    before do
      @client = create_client
    end
    
    it "should take in some arguments" do
      fake_get "/api/email/version/3/do/query?api_key=my_api_key&id_greater_than=200&format=simple&user_key=bar", sample_results
      
      @client.emails.query(:id_greater_than => 200).should == {"total_results" => 2, 
        "email"=>[
          {"name"=>"Announcement 1", "subject"=>"Confirm your identify"}, 
          {"name"=>"Announcement 2", "subject"=>"Welcome to GA"}, 
        ]}
    end
    
  end
  
end