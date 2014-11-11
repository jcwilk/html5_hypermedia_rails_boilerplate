module SC
  class Courses < Grape::API
    format :json

    namespace :courses do
      desc 'Get all the courses.'
      params do
        optional :page, type: Integer, default: 1, desc: 'Page to return.'
      end
      get do
        present Course.order('created_at').page(params[:page]), with: SC::Representers::Courses
      end
    end
  end
end
