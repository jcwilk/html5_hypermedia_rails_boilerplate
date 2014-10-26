module SC
  module Representers
    module Root
      include Roar::Representer::JSON::HAL
      include Roar::Representer::Feature::Hypermedia
      include Grape::Roar::Representer

      curies do |opts|
        [
          name: :sc,
          href: "#{base_url}/doc/{rel}", #TODO: Make this point at swagger?
          templated: true
        ]
      end

      link :self do
        "#{base_url}/sc"
      end

      link 'sc:courses' do
        "#{base_url}/sc/courses"
      end

      link :swagger_doc do
        "#{base_url}/sc/swagger_doc"
      end

      private

      def base_url
        request = Grape::Request.new(env)
        request.base_url
      end
    end
  end
end
