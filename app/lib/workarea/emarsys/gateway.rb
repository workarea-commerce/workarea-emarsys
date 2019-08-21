module Workarea
  module Emarsys
    class Gateway
      attr_reader :secret_key, :customer_id, :options

      def initialize(secret_key, customer_id, options = {})
        @secret_key = secret_key
        @customer_id = customer_id
        @options = options
      end

      def create_contact(attrs)
        base_uri = "/api/v2/internal/#{customer_id}/contact/"
        params = { create_if_not_exists: 1 }
        query_values = "?" + params.to_query

        path = base_uri + query_values

        request_data = sign_request('put', path, attrs.to_json)

        response = connection.put do |req|
          req.url path
          req.params = params
          req.body = attrs.to_json

          request_data[:headers].each do |k, v|
            req.headers[k] = v
          end
        end

        Response.new(response)
      end

      private

        def connection
          request_timeouts = {
            timeout: Workarea::Emarsys.config.api_timeout,
            open_timeout: Workarea::Emarsys.config.open_timeout
          }

          Faraday.new(url: rest_endpoint, request: request_timeouts)
        end

        def sign_request(method, path, body = nil)
          escher = Escher::Auth.new('eu/suite/ems_request', escher_options)

          request_data = {
            method: method.upcase,
            uri: path,
            body: body,
            headers: [['Content-Type', 'application/json'], ['host', host]]
          }

          escher.sign!(request_data, { api_key_id: escher_key, api_secret: secret_key })

          request_data
        end

        def escher_options
          {
            algo_prefix: 'EMS',
            vendor_key: 'EMS',
            auth_header_name: 'X-Ems-Auth',
            date_header_name: 'X-Ems-Date'
          }
        end

        def escher_key
          Workarea.config.emarsys.escher_key
        end

        def rest_endpoint
          "https://#{host}"
        end

        def host
          if test?
            "api-proxy.s.emarsys.com"
          else
            "api.emarsys.net"
          end
        end

        def uri_base
          "/api/v2/internal/#{customer_id}/"
        end

         def test?
          (options.has_key?(:test) ? options[:test] : true)
        end
    end
  end
end
