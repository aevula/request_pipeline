# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Request
      class Json < Middleware
        def call
          env.client.request(:json) unless env.client.builder.locked?

          app.call(env)
        end
      end
    end
  end
end
