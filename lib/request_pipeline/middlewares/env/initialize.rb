# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    module Env
      class Initialize < Middleware
        def call
          app.call(RequestPipeline::Env.new(env))
        end
      end
    end
  end
end
