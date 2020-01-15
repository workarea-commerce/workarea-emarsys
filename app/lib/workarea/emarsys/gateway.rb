module Workarea
  module Emarsys
    class Gateway
      attr_reader :secret_key, :user_name, :options

      def initialize(secret_key, user_name, options = {})
        @secret_key = secret_key
        @user_name = user_name
        @options = options
      end

      def create_contact(attrs)
        base_uri = "/api/v2/contact/"
        params = { create_if_not_exists: 1 }
        query_values = "?" + params.to_query

        path = base_uri + query_values

        response = connection.put do |req|
          req.url path
          req.params = params
          req.body = attrs.to_json
        end
        Response.new(response)
      end

      private

        def connection
          request_timeouts = {
            timeout: Workarea::Emarsys.config.api_timeout,
            open_timeout: Workarea::Emarsys.config.open_timeout
          }

          headers = {
            "Content-Type" => "application/json",
            "Accept"       => "application/json",
            "X-WSSE" => auth_header
          }

          Faraday.new(url: rest_endpoint, request: request_timeouts, headers: headers)
        end

        def auth_header
          nonce = SecureRandom.base64(32).first(32)
          timestamp = Time.now.utc.iso8601

          password_digest = Base64.encode64(Digest::SHA1.new.hexdigest(nonce + timestamp + secret_key)).strip

          header = 'UsernameToken ' +
            "Username=\"#{user_name}\", " +
            "PasswordDigest=\"#{password_digest}\", " +
            "Nonce=\"#{nonce}\", " +
            "Created=\"#{timestamp}\""

          header
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

         def test?
          (options.has_key?(:test) ? options[:test] : false)
        end
    end
  end
end
