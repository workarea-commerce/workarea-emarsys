module Workarea
  module Emarsys
    class Response
      def initialize(response)
        @response = response
      end

      def success?
        @response.success?
      end

      def body
        return unless @response.body
        @body ||= JSON.parse(@response.body)
      end
    end
  end
end
