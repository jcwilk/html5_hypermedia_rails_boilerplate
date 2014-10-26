module SC
  module Representers
    module Course
      include Roar::Representer::JSON::HAL
      include Roar::Representer::Feature::Hypermedia
      include Grape::Roar::Representer

      property :id

      curies do |opts|
        [
          name: :sc,
          href: "#{base_url(opts[:env])}/doc/{rel}", #TODO: Make this point at swagger?
          templated: true
        ]
      end

      link :self do
        "#{base_url}/sc/courses/#{id}"
      end

      link 'sc:root' do
        "#{base_url}/sc"
      end

      private

      def base_url(_env)
        binding.pry
        request = Grape::Request.new(_env || env)
        request.base_url
      end
    end
  end
end
