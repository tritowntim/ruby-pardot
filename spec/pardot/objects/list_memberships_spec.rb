require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Pardot::Objects::ListMemberships do
  
  before do
    @client = create_client
  end
  
  describe "query" do
    
    def sample_results
      %(<?xml version="1.0" encoding="UTF-8"?>\n<rsp stat="ok" version="1.0">
        <result>
          <total_results>2</total_results>
          <listMembership>
            <list_id>123456789</list_id>
            <prospect_id>223344</prospect_id>
          </listMembership>
          <listMembership>
            <list_id>11223344</list_id>
            <prospect_id>334455</prospect_id>
          </listMembership>
        </result>
      </rsp>)
    end
    
    before do
      @client = create_client
    end
    
    it "should take in some arguments" do
      fake_get "/api/listMembership/version/3/do/query?api_key=my_api_key&id_greater_than=200&format=simple&user_key=bar", sample_results
      
      @client.list_memberships.query(:id_greater_than => 200).should == {"total_results" => 2, 
        "listMembership"=>[
          {"list_id"=>"123456789", "prospect_id"=>"223344"}, 
          {"list_id"=>"11223344", "prospect_id"=>"334455"}, 
        ]}
    end
    
  end
  
end