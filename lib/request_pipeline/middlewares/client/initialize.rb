# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Client
      class Initialize < Middleware
        def call
          env[:client] = Faraday.new(env.client_options)

          app.call(env)
        end
      end
    end
  end
end
