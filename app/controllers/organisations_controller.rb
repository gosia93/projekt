class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /organisations
  # GET /organisations.json
  def index
    @organisations = Organisation.all
  end

  # GET /organisations/1
  # GET /organisations/1.json
  def show
  end

  # GET /organisations/new
  def new
    @organisation = Organisation.new
    @organisation.user_id = current_user.id
  end

  # GET /organisations/1/edit
  def edit
  end

  # POST /organisations
  # POST /organisations.json
  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.user_id = current_user.id
    respond_to do |format|
      if @organisation.save
        format.html { redirect_to @organisation, notice: 'Informacje zostały dodane.' }
        format.json { render :show, location: @user}
      else
        format.html { render :new }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organisations/1
  # PATCH/PUT /organisations/1.json
  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to edit_organisation_path(@organisation), notice: 'Informacje zostały zmienione.' }
        format.json { render :edit, status: :ok, location: @organisation }
      else
        format.html { render :edit }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1
  # DELETE /organisations/1.json
  def destroy
    @organisation.destroy
    respond_to do |format|
      format.html { redirect_to organisations_url, notice: 'Organisation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organisation_params
      params.require(:organisation).permit(:name, :regon, :city, :about, :user_id, :volontary_type_id, :logo, :video)
    end
end
