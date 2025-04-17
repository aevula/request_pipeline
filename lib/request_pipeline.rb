# frozen_string_literal: true

require 'pipelined'

require 'faraday'
require 'faraday/multipart'
require 'faraday/net_http_persistent'

require 'active_support/core_ext/module/delegation'

require 'request_pipeline/version'

require 'request_pipeline/helpers/env'

require 'request_pipeline/env'
require 'request_pipeline/pipeline'
require 'request_pipeline/middleware'
require 'request_pipeline/base'

require 'request_pipeline/middlewares/client/initialize'
require 'request_pipeline/middlewares/client/persistent'

require 'request_pipeline/middlewares/env/initialize'
require 'request_pipeline/middlewares/env/configure'

require 'request_pipeline/middlewares/logger/initialize'

require 'request_pipeline/middlewares/request/build'
require 'request_pipeline/middlewares/request/json'
require 'request_pipeline/middlewares/request/multipart'
require 'request_pipeline/middlewares/request/send'
require 'request_pipeline/middlewares/request/before'
require 'request_pipeline/middlewares/request/after'

require 'request_pipeline/middlewares/response/raw'
require 'request_pipeline/middlewares/response/body/raw'
require 'request_pipeline/middlewares/response/body/json'
require 'request_pipeline/middlewares/response/headers'
require 'request_pipeline/middlewares/response/status'

require 'request_pipeline/middlewares/cache/base'
require 'request_pipeline/middlewares/cache/rails'

module RequestPipeline; end
