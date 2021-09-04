class SearchController < ApplicationController

    def index
        if params[:query].present?
            if params[:options] == 'Events'
              redirect_to events_path(strong_params)
            else
                redirect_to users_path(strong_params)
            end
            
          end
    end

   def strong_params
    params.permit(:query, :options)
  end
end
