module Pardot
  module Objects
    module Emails

      def emails
        @emails ||= Emails.new self
      end
      
      class Emails
        
        def initialize client
          @client = client
        end
        
        def read id, params = {} 
          post "/do/read/id/#{id}", params
        end 

        def query params
          result = get "/do/query", params, "result"
          # result["total_results"] = result["total_results"].to_i if result["total_results"]
          result
        end

        protected

        def get path, params = {}, result = "email"
          response = @client.get "email", path, params
          result ? response[result] : response
        end 

        def post path, params = {}, result = "email"
          response = @client.post "email", path, params 
          result ? response[result] : response
        end

      end

    end
  end
end
