# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Logger
      class Initialize < Middleware
        def call
          env.client.response(:logger, env.logger, env.logger_options) unless env.client.builder.locked?

          app.call(env)
        end
      end
    end
  end
end
