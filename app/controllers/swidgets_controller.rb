class SwidgetsController < ApplicationController
  before_action :set_swidget, only: [:show, :edit, :update, :destroy]

  # GET /swidgets
  # GET /swidgets.json
  def index
    @swidgets = Swidget.all
  end

  # GET /swidgets/1
  # GET /swidgets/1.json
  def show
  end

  # GET /swidgets/new
  def new
    @swidget = Swidget.new
  end

  # GET /swidgets/1/edit
  def edit
  end

  # POST /swidgets
  # POST /swidgets.json
  def create
    @swidget = Swidget.new(swidget_params)

    respond_to do |format|
      if @swidget.save
        format.html { redirect_to @swidget, notice: 'Swidget was successfully created.' }
        format.json { render :show, status: :created, location: @swidget }
      else
        format.html { render :new }
        format.json { render json: @swidget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swidgets/1
  # PATCH/PUT /swidgets/1.json
  def update
    respond_to do |format|
      if @swidget.update(swidget_params)
        format.html { redirect_to @swidget, notice: 'Swidget was successfully updated.' }
        format.json { render :show, status: :ok, location: @swidget }
      else
        format.html { render :edit }
        format.json { render json: @swidget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swidgets/1
  # DELETE /swidgets/1.json
  def destroy
    @swidget.destroy
    respond_to do |format|
      format.html { redirect_to swidgets_url, notice: 'Swidget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swidget
      @swidget = Swidget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swidget_params
      params.require(:swidget).permit(:name, :widget_id)
    end
end
