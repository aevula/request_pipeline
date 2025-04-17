# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Client
      class Persistent < Middleware
        def call
          service_class = env.service.class
          env[:client] = service_class.instance_variable_get(:@client) ||
                         service_class.instance_variable_set(:@client, Faraday.new(env.client_options))

          app.call(env)
        end
      end
    end
  end
end
