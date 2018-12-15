class PropertiesController < ApplicationController
  before_action :set_user, only: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]


  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property = Property.find(params[:id])
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
    @property = Property.find(params[:id])
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:success] = "Property was successfully created."
      redirect_to @property
    else
      render 'new'
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    set_property
    if @property.update(property_params)
      redirect_to @property
    else
      render 'edit'
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    redirect_to properties_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:title, :user_id, :price, :description, :address, :status, {images: []})
    end
end
