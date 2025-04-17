# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Request
      class Send < Middleware
        def call
          env[:response] = send_request

          app.call(env)
        end

        private

        def send_request
          env.client.__send__(
            env.request_options[:request_verb],
            env.request_options[:request_path],
            body,
            env.request_options[:request_headers])
        end

        def body
          if Faraday::METHODS_WITH_BODY.include?(env.request_options[:request_verb].to_s)
            return env.request_options[:request_body].to_json
          end

          env.request_options[:request_body]
        end
      end
    end
  end
end
