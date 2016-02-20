class TextsController < ApplicationController
  before_action :set_text, only: [:show, :edit, :update, :destroy]

  def big
    @text = Text.find(params[:tid])
    render :layout => false
  end

  def small
    @text = Text.find(params[:tid])
    render :layout => false
  end

  # GET /texts
  # GET /texts.json
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @texts = @restaurant.texts
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
  end

  # GET /texts/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @text = Text.new
  end

  # GET /texts/1/edit
  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # POST /texts
  # POST /texts.json
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @text = Text.new(text_params)
    @widget = Widget.create(restaurant: @restaurant, widget_klass: "text", half: false)
    @text.widget = @widget

    respond_to do |format|
      if @text.save
        format.html { redirect_to [@restaurant,@text], notice: 'Text was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /texts/1
  # PATCH/PUT /texts/1.json
  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    respond_to do |format|
      if @text.update(text_params)
        format.html { redirect_to [@restaurant,@text], notice: 'Text was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @text.destroy
    respond_to do |format|
      format.html { redirect_to @restaurant, notice: 'Text was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text
      @text = Text.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_params
      params.require(:text).permit(:name, :text)
    end
end
