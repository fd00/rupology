# frozen_string_literal: true

require 'spec_helper'
require 'rupology/client'

describe Rupology::Client do
  it 'gets project' do
    client = Rupology::Client.new
    response = client.project('ruby')
    expect(response[0]['binname']).to include 'ruby'
  end

  it 'gets projects' do
    client = Rupology::Client.new
    response = client.projects('ruby')
    expect(response['ruby']).not_to be_nil
  end

  it 'gets projects (up to)' do
    client = Rupology::Client.new
    response = client.projects('ruby', {}, true)
    expect(response['ruby']).not_to be_nil
  end

  it 'gets projects (search)' do
    client = Rupology::Client.new
    response = client.projects('', { search: 'ruby' })
    expect(response['ruby']).not_to be_nil
  end

  it 'gets repository problems' do
    client = Rupology::Client.new
    response = client.problems('repository', 'freebsd')
    expect(response[0]['repo']).to eq 'freebsd'
  end

  it 'gets maintainer problems' do
    client = Rupology::Client.new
    response = client.problems('maintainer', 'ports@freebsd.org')
    expect(response[0]['maintainers']).to include 'ports@freebsd.org'
  end

  it 'gets invalid problems' do
    client = Rupology::Client.new
    expect { client.problems('invalid', 'invalid') }.to raise_error(ArgumentError)
  end
end
