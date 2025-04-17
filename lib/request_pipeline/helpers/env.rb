# frozen_string_literal: true

module RequestPipeline
  module Helpers
    module Env
      def service
        env[:service]
      end

      def request
        env[:request]
      end

      def response
        env[:response]
      end

      def client
        env[:client]
      end

      def client_options
        env[:client_options] ||= {}
      end

      def request_options
        env[:request_options] ||= {}
      end

      def logger
        env[:logger]
      end

      def logger_options
        env[:logger_options] ||= {}
      end

      def cache_manager
        env[:cache_manager]
      end

      def cache_options
        env[:cache_options] ||= {}
      end

      def persistent_options
        env[:persistent_options] ||= {}
      end

      def multipart_options
        env[:multipart_options] ||= {}
      end
    end
  end
end
