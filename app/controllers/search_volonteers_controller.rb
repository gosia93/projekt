
# encoding: utf-8
class SearchVolonteersController < ApplicationController
 

  

  # GET /search_volonteers/1
  # GET /search_volonteers/1.json
  def show
     @search_volonteers = SearchVolonteer.find(params[:id])
  end

  # GET /search_volonteers/new
  def new
    @search_volonteer = SearchVolonteer.new
  end



  # POST /search_volonteers
  # POST /search_volonteers.json
  def create
     @search_volonteer = SearchVolonteer.create(search_volonteer_params)
    redirect_to @search_volonteer
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_volonteer_params
      params.require(:search_volonteer).permit(:city, :volontary_type_id)
    end
end
