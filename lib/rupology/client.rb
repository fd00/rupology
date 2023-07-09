# frozen_string_literal: true

require 'faraday'
require 'json'

module Rupology
  class Client
    DEFAULT_URL = 'https://repology.org'

    def initialize(url = DEFAULT_URL)
      @connection = Faraday.new(url:)
    end

    def project(package)
      response = @connection.get do |request|
        request.url("/api/v1/project/#{package}")
      end
      JSON.parse(response.body)
    end

    def projects(pivot_package, params = {}, up_to: false)
      response = @connection.get do |request|
        pivot_package = "..#{pivot_package}" if up_to
        pivot_package += '/' unless pivot_package.empty?
        request.url("/api/v1/projects/#{pivot_package}")
        request.params = params
      end
      JSON.parse(response.body)
    end

    def problems_for_repository(repository, params = {})
      response = @connection.get do |request|
        request.url("/api/v1/repository/#{repository}/problems")
        request.params = params
      end
      JSON.parse(response.body)
    end

    def problems_for_maintainer(maintainer, repository, params = {})
      response = @connection.get do |request|
        request.url("/api/v1/maintainer/#{maintainer}/problems-for-repo/#{repository}")
        request.params = params
      end
      JSON.parse(response.body)
    end
  end
end
