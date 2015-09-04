class StaticRoutesController < ApplicationController

  def index
      #render :layout=>"homepage"
      @homepage = "asdasdasds"
  end
    
  def courses
      @classes = Hash.new("")
  end
    
    def mercury_update_classes
        #@classes = MercuryPage.find(params[:id])
        #...
        render text: "Saved!"
    end
    
    def mercury_update_index
        @homepage = MercuryPage.find(params[:id])
        @homepage.body = params[:content][:homepage_content]
        #...
        render text: "Saved!"
    end
end
