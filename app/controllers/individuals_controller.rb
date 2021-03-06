class IndividualsController < ApplicationController

  before_action :set_individual, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /individuals
  # GET /individuals.json
  def index
     @individuals = Individual.search_for(params[:search], :order => params[:order]).page(params[:page]).per(5).all
  rescue => e
    flash[:error] = e.to_s
    @individuals= Individual.search_for ''
  end

  # GET /individuals/1
  # GET /individuals/1.json
  def show
  end

  # GET /individuals/new
  def new
    @individual = Individual.new
    @individual.user_id = current_user.id
  end

  # GET /individuals/1/edit
  def edit
  end

  # POST /individuals
  # POST /individuals.json
  def create
    @individual = Individual.new(individual_params)
    @individual.user_id = current_user.id

    respond_to do |format|
      if @individual.save
        format.html { redirect_to edit_individual_path(@individual), notice: 'Informacje zostały dodane!' }
        format.json { render :edit, status: :created, location: @individual }
      else
        format.html { render :new }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /individuals/1
  # PATCH/PUT /individuals/1.json
  def update
    respond_to do |format|
      if @individual.update(individual_params)
        format.html { redirect_to @individual, notice: 'Informacje zostały zmienione.' }
        format.json { render :show, status: :ok, location: @individual }
      else
        format.html { render :edit }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individuals/1
  # DELETE /individuals/1.json
  def destroy
    @individual.destroy
    respond_to do |format|
      format.html { redirect_to individuals_url, notice: 'Individual was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual
      @individual = Individual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def individual_params
      params.require(:individual).permit(:name, :surname, :age, :city, :about, :needs, :user_id, :photo)
    end

    def auto_complete_search
    begin
      @items = Volonteer.complete_for(params[:search])
    rescue ScopedSearch::QueryNotSupported => e
      @items = [{:error =>e.to_s}]
    end
    render :json => @items
  end
end
