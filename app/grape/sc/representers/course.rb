module SC
  module Representers
    module Course
      include Roar::Representer::JSON::HAL
      include Grape::Roar::Representer

      property :id

      curies do |opts|
        [
          name: :sc,
          href: "#{base_url(opts)}/doc/{rel}", #TODO: Make this point at swagger?
          templated: true
        ]
      end

      link :self do |opts|
        "#{base_url(opts)}/sc/courses/#{id}"
      end

      link 'sc:root' do |opts|
        "#{base_url(opts)}/sc"
      end

      private

      def base_url(opts)
        request = Grape::Request.new(opts[:env])
        request.base_url
      end
    end
  end
end
