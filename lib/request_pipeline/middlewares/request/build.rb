# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Request
      class Build < Middleware
        def call
          prepare(:body)
          prepare(:headers)

          app.call(env)
        end

        private

        def prepare(key)
          initial = env.request_options[:"request_#{key}"] || env.request_options[:"default_#{key}"] || {}
          env.request_options[:"request_#{key}"] = initial.merge(env.request_options[:"constant_#{key}"] || {})
        end
      end
    end
  end
end
