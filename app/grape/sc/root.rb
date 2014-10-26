module SC
  class Root < Grape::API
    #prefix 'sc'
    format :json

    desc 'The API root.'
    params do
    end
    get do
      present self, with: SC::Representers::Root
    end

    mount SC::Courses

    add_swagger_documentation api_version: 'v1'
  end
end
