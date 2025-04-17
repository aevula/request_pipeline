# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Request
      class Before < Middleware
        def call
          before_request

          app.call(env)
        end

        private

        def before_request
          return unless env.service.respond_to?(:before_request)

          args = [:before_request]
          args << env if env.service.method(:before_request).arity.nonzero?
          env.service.__send__(*args)
        end
      end
    end
  end
end
