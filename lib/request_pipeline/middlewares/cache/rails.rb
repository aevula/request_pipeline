# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Cache
      class Rails < Base
        private

        def with_cache
          ::Rails.cache.fetch(cache_key, **cache_options, &block)
        end

        def cache_options
          options = {
            race_condition_ttl: env.cache_options[:race_condition_ttl],
            skip_nil:           env.cache_options[:skip_nil],
            force:              env.cache_options[:force]
          }

          if ::Rails.configuration.cache_store.first == :redis_cache_store
            options[:expires_in] = env.cache_options[:expires_in]
          end

          options
        end
      end
    end
  end
end
