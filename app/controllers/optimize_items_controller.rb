class OptimizeItemsController < ApplicationController
  before_action :set_optimize_item, only: [:show, :edit, :update, :destroy]

  # GET /optimize_items
  # GET /optimize_items.json
  def index
    @optimize_items = OptimizeItem.all
  end

  # GET /optimize_items/1
  # GET /optimize_items/1.json
  def show
  end

  # GET /optimize_items/new
  def new
    @optimize_item = OptimizeItem.new
  end

  # GET /optimize_items/1/edit
  def edit
  end

  # POST /optimize_items
  # POST /optimize_items.json
  def create
    @optimize_item = OptimizeItem.new(optimize_item_params)

    respond_to do |format|
      if @optimize_item.save
        format.html { redirect_to @optimize_item, notice: 'Optimize item was successfully created.' }
        format.json { render :show, status: :created, location: @optimize_item }
      else
        format.html { render :new }
        format.json { render json: @optimize_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /optimize_items/1
  # PATCH/PUT /optimize_items/1.json
  def update
    respond_to do |format|
      if @optimize_item.update(optimize_item_params)
        format.html { redirect_to @optimize_item, notice: 'Optimize item was successfully updated.' }
        format.json { render :show, status: :ok, location: @optimize_item }
      else
        format.html { render :edit }
        format.json { render json: @optimize_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /optimize_items/1
  # DELETE /optimize_items/1.json
  def destroy
    @optimize_item.destroy
    respond_to do |format|
      format.html { redirect_to optimize_items_url, notice: 'Optimize item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_optimize_item
      @optimize_item = OptimizeItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def optimize_item_params
      params.require(:optimize_item).permit(:content, :status, :from, :in_charge)
    end
end
