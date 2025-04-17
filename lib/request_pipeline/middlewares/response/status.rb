# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Response
      class Status < Middleware
        def call
          app.call(env.response.status)
        end
      end
    end
  end
end
