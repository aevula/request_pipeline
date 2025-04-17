# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Response
      class Headers < Middleware
        def call
          app.call(env.response.headers)
        end
      end
    end
  end
end
