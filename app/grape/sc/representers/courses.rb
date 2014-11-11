module SC
  module Representers
    module Courses
      include Roar::Representer::JSON::HAL
      include Grape::Roar::Representer

      curies do |opts|
        [
          name: :sc,
          href: "#{base_url(opts)}/doc/{rel}", #TODO: Make this point at swagger?
          templated: true
        ]
      end

      collection :to_a, extend: Representers::Course, as: :courses, embedded: true

      private

      def base_url(opts)
        request = Grape::Request.new(opts[:env])
        request.base_url
      end
    end
  end
end
