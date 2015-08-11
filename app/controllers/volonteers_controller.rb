class VolonteersController < ApplicationController
  before_action :set_volonteer, only: [:show, :edit, :update, :destroy]

  # GET /volonteers
  # GET /volonteers.json
  def index
     @volonteers = Volonteer.search_for(params[:search], :order => params[:order]).all
  rescue => e
    flash[:error] = e.to_s
    @volonteers= Volonteer.search_for ''
  end

  # GET /volonteers/1
  # GET /volonteers/1.json
  def show
  end

  # GET /volonteers/new
  def new
    @volonteer = Volonteer.new
    @volonteer.user_id = current_user.id
  end

  # GET /volonteers/1/edit
  def edit
  end

  # POST /volonteers
  # POST /volonteers.json
  def create
    @volonteer = Volonteer.new(volonteer_params)
     @volonteer.user_id = current_user.id
    respond_to do |format|
      if @volonteer.save
        format.html { redirect_to @volonteer, notice: 'Informacje zostały dodane' }
        format.json { render :show, status: :created, location: @volonteer }
      else
        format.html { render :new }
        format.json { render json: @volonteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volonteers/1
  # PATCH/PUT /volonteers/1.json
  def update
    respond_to do |format|
      if @volonteer.update(volonteer_params)

        format.html {redirect_to :back, notice: "Informacje zostały zmienione" }
        format.json { render :edit, status: :ok, location: @volonteer}
      else
        format.html { render :edit }
        format.json { render json: @volonteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volonteers/1
  # DELETE /volonteers/1.json
  def destroy
    @volonteer.destroy
    respond_to do |format|
      format.html { redirect_to volonteers_url, notice: 'Volonteer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volonteer
      @volonteer = Volonteer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volonteer_params
      params.require(:volonteer).permit(:name, :surname, :age, :city, :about, :user_id, :volontary_type_id, :photo)
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
