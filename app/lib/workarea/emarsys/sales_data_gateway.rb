module Workarea
  module Emarsys
    class SalesDataGateway
      attr_reader :secret_key, :options

      def initialize(secret_key, options = {})
        @secret_key = secret_key
        @options = options
      end

      def send_file(file)
        path = "/hapi/merchant/#{merchant_id}/sales-data/api"

        response = connection.post do |req|
          req.url path
          req.body = File.read(file)
        end
        Response.new(response)
      end

      private

        def connection
          headers = {
            'Content-Type' => 'text/csv',
            'Accept' => 'text/plain',
            'Authorization' => "Bearer #{secret_key}"
          }

          request_timeouts = {
            timeout: Workarea::Emarsys.config.api_timeout,
            open_timeout: Workarea::Emarsys.config.open_timeout
          }

          Faraday.new(url: rest_endpoint, headers: headers,  request: request_timeouts) do |con|
            con.request :multipart
            con.request :url_encoded
            con.adapter :net_http
          end
        end

        def rest_endpoint
          "https://admin.scarabresearch.com"
        end

        def merchant_id
          options[:merchant_id]
        end
    end
  end
end
