module Workarea
  module Emarsys
    class BogusGateway

      attr_reader :options

      def initialize(options = {})
        @options = options
      end

      def method_missing(method, *args)
        response
      end

      private

        def response
          response = Faraday.new do |builder|
            builder.adapter :test do |stub|
              stub.get('/rest/bogus.json') { |env| [ 200, {}, response_body ] }
            end
          end
          r = response.get('/rest/bogus.json')
          Response.new(r)
        end

        def response_body
          {
            "data" => {
              "ids" => ['123456']
            }
          }.to_json
        end
    end
  end
end
