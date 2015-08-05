class VolontaryTypesController < ApplicationController
load_and_authorize_resource

  # GET /volontary_types
  # GET /volontary_types.json
  def index
    @volontary_types = VolontaryType.all
  end

  # GET /volontary_types/1
  # GET /volontary_types/1.json
  def show
  end

  # GET /volontary_types/new
  def new
    @volontary_type = VolontaryType.new
  end

  # GET /volontary_types/1/edit
  def edit
  end

  # POST /volontary_types
  # POST /volontary_types.json
  def create
    @volontary_type = VolontaryType.new(volontary_type_params)

    respond_to do |format|
      if @volontary_type.save
        format.html { redirect_to @volontary_type, notice: 'Volontary type was successfully created.' }
        format.json { render :show, status: :created, location: @volontary_type }
      else
        format.html { render :new }
        format.json { render json: @volontary_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volontary_types/1
  # PATCH/PUT /volontary_types/1.json
  def update
    respond_to do |format|
      if @volontary_type.update(volontary_type_params)
        format.html { redirect_to @volontary_type, notice: 'Volontary type was successfully updated.' }
        format.json { render :show, status: :ok, location: @volontary_type }
      else
        format.html { render :edit }
        format.json { render json: @volontary_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volontary_types/1
  # DELETE /volontary_types/1.json
  def destroy
    @volontary_type.destroy
    respond_to do |format|
      format.html { redirect_to volontary_types_url, notice: 'Volontary type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volontary_type
      @volontary_type = VolontaryType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volontary_type_params
      params.require(:volontary_type).permit(:name)
    end
end
