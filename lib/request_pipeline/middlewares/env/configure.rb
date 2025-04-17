# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Env
      class Configure < Middleware
        def call
          fetch_client_options
          fetch_request_options
          fetch_logging_options
          fetch_cache_options
          fetch_persistent_options
          fetch_multipart_options

          app.call(env)
        end

        private

        def fetch_client_options
          fetch_all(:client_options)
          env.client_options[:url] = fetch(:client_url)
        end

        def fetch_request_options
          fetch_all(
            :request_options,
            :request_verb,
            :request_path,
            :constant_body,
            :constant_headers,
            :default_body,
            :default_headers,
            :overridable_body,
            :overridable_headers)
        end

        def fetch_logging_options
          env[:logger] = fetch(:logger)
          fetch_all(:logger_options)
        end

        def fetch_cache_options
          fetch_all(:cache_options,
                    :cache_prefix,
                    :cache_key,
                    :cache_expires_in,
                    :cache_race_condition_ttl,
                    :cache_skip_nil,
                    :cache_force)
        end

        def fetch_persistent_options
          fetch_all(:persistent_options, :persistent_pool_size, :persistent_idle_timeout)
        end

        def fetch_multipart_options
          fetch_all(:multipart_options)
        end

        def fetch_all(option, *options)
          env[option] = fetch(option) || {}
          options.each { |opt| env[option][opt] = fetch(opt) }
        end

        def fetch(option)
          const_name = option.to_s.upcase
          return env.service.class.const_get(const_name).dup if env.service.class.const_defined?(const_name)

          from_method(option)
        end

        def from_method(option)
          return unless env.service.respond_to?(option)

          args = [option]
          args << env if env.service.method(option).arity.nonzero?

          env.service.__send__(*args).dup
        end
      end
    end
  end
end
