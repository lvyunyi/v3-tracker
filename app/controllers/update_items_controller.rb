class UpdateItemsController < ApplicationController
  before_action :set_update_item, only: [:show, :edit, :update, :destroy]

  # GET /update_items
  # GET /update_items.json
  def index
    @update_items = UpdateItem.all
  end

  # GET /update_items/1
  # GET /update_items/1.json
  def show
  end

  # GET /update_items/new
  def new
    @update_item = UpdateItem.new
  end

  # GET /update_items/1/edit
  def edit
  end

  # POST /update_items
  # POST /update_items.json
  def create
    @update_item = UpdateItem.new(update_item_params)

    respond_to do |format|
      if @update_item.save
        format.html { redirect_to @update_item, notice: 'Update item was successfully created.' }
        format.json { render :show, status: :created, location: @update_item }
      else
        format.html { render :new }
        format.json { render json: @update_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /update_items/1
  # PATCH/PUT /update_items/1.json
  def update
    respond_to do |format|
      if @update_item.update(update_item_params)
        format.html { redirect_to @update_item, notice: 'Update item was successfully updated.' }
        format.json { render :show, status: :ok, location: @update_item }
      else
        format.html { render :edit }
        format.json { render json: @update_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /update_items/1
  # DELETE /update_items/1.json
  def destroy
    @update_item.destroy
    respond_to do |format|
      format.html { redirect_to update_items_url, notice: 'Update item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_update_item
      @update_item = UpdateItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_item_params
      params.require(:update_item).permit(:content, :from)
    end
end
