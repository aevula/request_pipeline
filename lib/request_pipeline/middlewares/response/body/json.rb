# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Response
      module Body
        class Json < Middleware
          def call
            app.call(JSON.parse(env.response.body, symbolize_names: true))
          end
        end
      end
    end
  end
end
