# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Cache
      class Base < Middleware
        def call
          return app.call(env) unless use_cache?

          with_cache { app.call(env) }
        end

        private

        def use_cache?
          env.request_options[:request_verb].to_s == 'get'
        end

        def with_cache(&block)
          raise(NotImplementedError)
        end

        def cache_key
          [
            env.cache_options[:cache_prefix],
            env.cache_options[:cache_key] || env.request_options[:request_body].to_a.join
          ].join
        end
      end
    end
  end
end
