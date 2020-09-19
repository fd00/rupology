# frozen_string_literal: true

require 'faraday'
require 'json'

module Rupology
  class Client
    DEFAULT_URL = 'https://repology.org'

    def initialize(url = DEFAULT_URL)
      @connection = Faraday.new(url: url)
    end

    def project(package)
      response = @connection.get do |request|
        request.url('/api/v1/project/' + package)
      end
      JSON.parse(response.body)
    end

    def projects(pivot_package, params = {}, up_to = false)
      response = @connection.get do |request|
        pivot_package = '..' + pivot_package if up_to
        pivot_package += '/' unless pivot_package.empty?
        request.url('/api/v1/projects/' + pivot_package)
        request.params = params
      end
      JSON.parse(response.body)
    end

    def problems(type, key, params = {})
      raise ArgumentError, "type should be 'repository' or 'maintainer'" unless %w[repository maintainer].include?(type)

      response = @connection.get do |request|
        request.url('/api/v1/' + type + '/' + key + '/problems')
        request.params = params
      end
      JSON.parse(response.body)
    end
  end
end
