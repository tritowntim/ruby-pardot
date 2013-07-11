require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Pardot::Objects::Campaigns do
  
  before do
    @client = create_client
  end
  
  describe "query" do
    
    def sample_results
      %(<?xml version="1.0" encoding="UTF-8"?>\n<rsp stat="ok" version="1.0">
        <result>
          <total_results>3</total_results>
          <campaign>
            <id>77</id>
            <name>Campaign Alpha</name>
          </campaign>
          <campaign>
            <id>88</id>
            <name>Campaign Beta</name>
          </campaign>
          <campaign>
            <id>99</id>
            <name>Campaign Delta</name>
          </campaign>
        </result>
      </rsp>)
    end
    
    before do
      @client = create_client
    end
    
    it "should return results" do
      fake_get "/api/campaign/version/3/do/query?api_key=my_api_key&format=simple&user_key=bar", sample_results
      
      @client.campaigns.query({}).should == {"total_results" => 3, 
        "campaign"=>[
          {"id"=>"77", "name"=>"Campaign Alpha"}, 
          {"id"=>"88", "name"=>"Campaign Beta"}, 
          {"id"=>"99", "name"=>"Campaign Delta"}, 
        ]}
    end
    
  end
  
end