require 'rails_helper'

describe 'courses hypermedia' do
  def app
    Html5HypermediaRailsBoilerplate::Application
  end

  let(:client) do
    HyperResource.new(root: 'https://api.example.com/sc',
      faraday_options: {
        builder: Faraday::RackBuilder.new do |builder|
          builder.adapter :rack, app
        end
      }
    )
  end

  context 'when there are existing courses' do
    before { 2.times { Course.create!} }

    it 'returns the courses' do
      expect(client.courses.count).to eq(2)
    end
  end
end
