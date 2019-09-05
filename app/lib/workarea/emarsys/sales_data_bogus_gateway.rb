module Workarea
  module Emarsys
    class SalesDataBogusGateway
      attr_reader :options

      def initialize(options = {})
        @options = options
      end

      def send_file(file)
        Response.new(response)
      end

      private

        def response
          response = Faraday.new do |builder|
            builder.adapter :test do |stub|
              stub.get('/rest/bogus.json') { |env| [ 200, {}, nil ] }
            end
          end
          r = response.get('/rest/bogus.json')
          Response.new(r)
        end
    end
  end
end
