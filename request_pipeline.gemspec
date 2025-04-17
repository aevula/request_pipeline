# frozen_string_literal: true

require_relative 'lib/request_pipeline/version'

Gem::Specification.new do |spec|
  spec.name = 'request_pipeline'
  spec.version = RequestPipeline::VERSION

  spec.summary = 'Pipeline architectured HTTP client wrapper build on Faraday.'
  spec.description = 'Gem designed for cleaner and more intuitive way of handling HTTP requests
                     adhering to the pipeline pattern.'

  spec.authors = ['@aevula']
  spec.homepage = 'https://github.com/aevula/request_pipeline'
  spec.license = 'MIT'

  spec.required_ruby_version = '>= 3.0'

  spec.metadata = {
    'homepage_uri'          => 'https://github.com/aevula/request_pipeline',
    'source_code_uri'       => 'https://github.com/aevula/request_pipeline/tree/master',
    'changelog_uri'         => 'https://github.com/aevula/request_pipeline/tree/master/CHANGELOG.md',
    'rubygems_mfa_required' => 'true'
  }

  spec.files = Dir['README.md', 'LICENSE.txt', 'CHANGELOG.md', 'lib/**/*', 'Rakefile']

  spec.require_paths = ['lib']

  spec.add_dependency('faraday-multipart', '~> 1.0')
  spec.add_dependency('faraday-net_http_persistent', '~> 2.0')
  spec.add_dependency('pipelined', '~> 0.0')
end
