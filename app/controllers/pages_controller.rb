class PagesController < ApplicationController

    # GET /
    def index
        redirect_to articles_path if logged_in?
    end

    # GET /about
    def about
    end

end
