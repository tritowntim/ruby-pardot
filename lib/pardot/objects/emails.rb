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
        
        protected
        
        def post path, params = {}, result = "email"
          response = @client.post "email", path, params 
          result ? response[result] : response
        end

      end

    end
  end
end
