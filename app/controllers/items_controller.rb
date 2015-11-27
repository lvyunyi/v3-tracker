class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :finish, :unfinish]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all.reverse
    @item = Item.new
    @finish = (Item.where(status: true).length.to_f/Item.all.length.to_f*100).round.to_f
  end

  def undone
    @items = Item.where(status: false).reverse
    #@items = Item.all.reverse
    @item = Item.new
    @finish = (Item.where(status: true).length.to_f/Item.all.length.to_f*100).round.to_f
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: '添加完成' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path, notice: '更新成功..' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish
    respond_to do |format|
      if @item.update_attribute(:status, true)
        format.html { redirect_to :back, notice: '已经完成..' }
      else
        format.html { redirect_to :back, notice: '失败...联系系统管理员吧 ╮(╯▽╰)╭' }
      end
    end
  end

  def unfinish
    respond_to do |format|
      if @item.update_attribute(:status, false)
        format.html { redirect_to :back, notice: '取消完成..' }
      else
        format.html { redirect_to :back, notice: '失败...联系系统管理员吧 ╮(╯▽╰)╭' }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: '删除成功' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:status, :content, :name)
    end
end
