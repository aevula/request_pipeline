# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Request
      class After < Middleware
        def call
          after_request

          app.call(env)
        end

        private

        def after_request
          return unless env.service.respond_to?(:after_request)

          args = [:after_request]
          args << env if env.service.method(:after_request).arity.nonzero?
          env.service.__send__(*args)
        end
      end
    end
  end
end
