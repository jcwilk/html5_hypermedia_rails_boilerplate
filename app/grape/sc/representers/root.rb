module SC
  module Representers
    module Root
      include Roar::Representer::JSON::HAL
      include Grape::Roar::Representer

      curies do |opts|
        [
          name: :sc,
          href: "#{base_url(opts)}/doc/{rel}", #TODO: Make this point at swagger?
          templated: true
        ]
      end

      link :self do |opts|
        "#{base_url(opts)}/sc"
      end

      link 'sc:courses' do |opts|
        "#{base_url(opts)}/sc/courses"
      end

      link :swagger_doc do |opts|
        "#{base_url(opts)}/sc/swagger_doc"
      end

      private

      def base_url(opts)
        request = Grape::Request.new(opts[:env])
        request.base_url
      end
    end
  end
end
