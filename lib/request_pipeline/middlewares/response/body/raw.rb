# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Response
      module Body
        class Raw < Middleware
          def call
            app.call(env.response.body)
          end
        end
      end
    end
  end
end
