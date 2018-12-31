require 'spec_helper'
require 'rupology/client'

describe Rupology::Client do
  it 'gets metapackage' do
    client = Rupology::Client.new
    response = client.metapackage('ruby')
    expect(response[0]['name']).to start_with 'ruby'
  end

  it 'gets metapackages' do
    client = Rupology::Client.new
    response = client.metapackages('ruby')
    expect(response['ruby']).not_to be_nil
  end

  it 'gets metapackages (up to)' do
    client = Rupology::Client.new
    response = client.metapackages('ruby', true)
    expect(response['ruby']).not_to be_nil
  end

  it 'gets repository problems' do
    client = Rupology::Client.new
    response = client.problems('repository', 'freebsd')
    expect(response[0]['repo']).to eq 'freebsd'
  end

  it 'filters 010editor' do
    client = Rupology::Client.new
    responce = client.filter(search: '010editor')
    expect(responce['010editor']).not_to be_nil
    expect(responce.length).to be 1
  end

  it 'gets maintainer problems' do
    client = Rupology::Client.new
    response = client.problems('maintainer', 'ports@freebsd.org')
    expect(response[0]['maintainers']).to include 'ports@freebsd.org'
  end
end
