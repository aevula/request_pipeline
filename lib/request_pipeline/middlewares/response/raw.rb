# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Response
      class Raw < Middleware
        def call
          app.call(env.response)
        end
      end
    end
  end
end
