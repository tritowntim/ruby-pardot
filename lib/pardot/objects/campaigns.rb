module Pardot
  module Objects
    module Campaigns
      
      def campaigns
        @campaigns ||= Campaigns.new self
      end
      
      class Campaigns
        
        def initialize client
          @client = client
        end
        
        def query params
          result = get "/do/query", params, "result"
          result["total_results"] = result["total_results"].to_i if result["total_results"]
          result
        end
        
        protected
        
        def get path, params = {}, result = "campaign"
          response = @client.get "campaign", path, params
          result ? response[result] : response
        end 
        
      end
      
    end
  end
end
