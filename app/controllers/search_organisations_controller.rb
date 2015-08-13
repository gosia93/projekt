class SearchOrganisationsController < ApplicationController

 load_and_authorize_resource

  # GET /search_organisations/1
  # GET /search_organisations/1.json
  def show
    @search_organisations = SearchOrganisation.find(params[:id])
  end

  # GET /search_organisations/new
  def new
    @search_organisation = SearchOrganisation.new

  end


  # POST /search_organisations
  # POST /search_organisations.json
  def create
    @search_organisation = SearchOrganisation.create(search_organisation_params)
    redirect_to @search_organisation
  end

  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_organisation_params
      params.require(:search_organisation).permit(:city, :volontary_type_id)
    end

end
