module SC
  module Representers
    module Courses
      include Roar::Representer::JSON::HAL
      include Roar::Representer::Feature::Hypermedia
      include Grape::Roar::Representer

      collection :to_a, extend: Representers::Course, as: :courses, embedded: true
    end
  end
end
