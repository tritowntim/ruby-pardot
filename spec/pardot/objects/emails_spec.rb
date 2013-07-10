require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Pardot::Objects::Emails do
  
  before do
    @client = create_client
  end
  
  describe "read" do
    
    def sample_results
      %(<?xml version="1.0" encoding="UTF-8"?>\n<rsp stat="ok" version="1.0">
        <email>
          <name>Announcement 1</name>
          <subject>Welcome to GA</subject>
        </email>
      </rsp>)
    end 
    
    it "in some arguments" do
      fake_post "/api/email/version/3/do/read/id/1?api_key=my_api_key&format=simple&user_key=bar", sample_results

      @client.emails.read(1).should == {"name"=>"Announcement 1", "subject"=>"Welcome to GA"}
    end
    
  end
  
end