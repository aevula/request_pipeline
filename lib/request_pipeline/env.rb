# frozen_string_literal: true

module RequestPipeline
  class Env
    include RequestPipeline::Helpers::Env

    attr_reader :env

    delegate(*({}.methods - Object.methods), to: :env)

    def initialize(env = {})
      @env = env
    end
  end
end
