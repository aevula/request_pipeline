# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Request
      class Multipart < Middleware
        def call
          env.client.request(:miltipart, **env.multipart_options) unless env.client.builder.locked?
          env.request_options[:constant_headers][:'Content-Type'] = 'multipart/form-data'

          app.call(env)
        end
      end
    end
  end
end
