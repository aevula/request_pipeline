# frozen_string_literal: true

module RequestPipeline
  module Middlewares
    class Order < Pipeline
      ORDER = [
        Env::Initialize,
        Env::Configure,
        Client::Persistent,
        Client::Initialize,
        Logger::Initialize,
        Request::Json,
        Request::Multipart,
        Request::Build,
        Request::Cache,
        Request::Before,
        Request::Send,
        Request::After,
        Response::Raw,
        Response::Body::Json,
        Response::Body::Raw,
        Response::Status,
        Response::Headers
      ].freeze
      public_constant :ORDER

      def self.all
        @all ||= new(ORDER)
      end

      def call
        raise(NotImplementedError)
      end
    end
  end
end
