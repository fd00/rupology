require 'faraday'
require 'json'

module Rupology
  class Client
    DEFAULT_URL = 'https://repology.org'.freeze

    def initialize(url = DEFAULT_URL)
      @connection = Faraday.new(url: url)
    end

    def metapackage(package)
      response = @connection.get do |request|
        request.url('/api/v1/metapackage/' + package)
      end
      JSON.parse(response.body)
    end

    def metapackages(pivot_package, up_to = false)
      response = @connection.get do |request|
        pivot_package = '..' + pivot_package if up_to
        request.url('/api/v1/metapackages/' + pivot_package + '/')
      end
      JSON.parse(response.body)
    end

    def filter(params = {})
      response = @connection.get do |request|
        request.url('/api/v1/metapackages/')
        request.params = params
      end
      JSON.parse(response.body)
    end

    def problems(type, key, params = {})
      response = @connection.get do |request|
        request.url('/api/v1/' + type + '/' + key + '/problems')
        request.params = params
      end
      JSON.parse(response.body)
    end
  end
end
