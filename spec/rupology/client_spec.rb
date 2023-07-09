# frozen_string_literal: true

require 'spec_helper'
require 'rupology/client'

describe Rupology::Client do
  it 'gets project' do
    client = described_class.new
    response = client.project('ruby')
    expect(response[0]['binname']).to include 'ruby'
  end

  it 'gets projects' do
    client = described_class.new
    response = client.projects('ruby')
    expect(response['ruby']).not_to be_nil
  end

  it 'gets projects (up to)' do
    client = described_class.new
    response = client.projects('ruby', {}, up_to: true)
    expect(response['ruby']).not_to be_nil
  end

  it 'gets projects (search)' do
    client = described_class.new
    response = client.projects('', { search: 'ruby' })
    expect(response['ruby']).not_to be_nil
  end

  it 'gets problems for repository' do
    client = described_class.new
    response = client.problems_for_repository('freebsd')
    expect(response[0]['repo']).to eq 'freebsd'
  end

  it 'gets problems for maintainer' do
    client = described_class.new
    response = client.problems_for_maintainer('ports@freebsd.org', 'freebsd')
    expect(response[0]['maintainers']).to include 'ports@freebsd.org'
  end
end
