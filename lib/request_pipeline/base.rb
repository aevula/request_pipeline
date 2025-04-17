# frozen_string_literal: true

module RequestPipeline
  class Base
    class << self
      attr_reader :pipeline
    end

    def self.use_middlewares(*middlewares, &block)
      use_pipeline(RequestPipeline::Pipeline.new(middlewares), &block)
    end

    def self.use_pipeline(pipeline, &block)
      raise(ArgumentError) unless pipeline.is_a?(RequestPipeline::Pipeline)

      @pipeline = pipeline
      yield pipeline if block
      pipeline
    end

    def self.inherited(child)
      super
      child.use_pipeline(pipeline) if pipeline
    end

    def call(**opts)
      self.class.pipeline.call({ service: self, custom: opts })
    end
  end
end
