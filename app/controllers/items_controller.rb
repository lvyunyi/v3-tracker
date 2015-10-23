class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :finish, :unfinish]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @item = Item.new
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
        format.html { redirect_to items_path, notice: '添加完成，快召唤你的小伙伴消灭TA吧┏ (゜ω゜)=☞' }
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
        format.html { redirect_to items_path, notice: '更新成功...吓得我都坐地上了 ╮(╯▽╰)╭' }
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
        format.html { redirect_to items_path, notice: '已经完成...世界更加和平了 <(￣▽￣)> 哇哈哈…' }
      else
        format.html { redirect_to items_path, notice: '失败...联系系统管理员吧 ╮(╯▽╰)╭' }
      end
    end
  end

  def unfinish
    respond_to do |format|
      if @item.update_attribute(:status, false)
        format.html { redirect_to items_path, notice: '取消完成...你就是那个传说中的大魔王么 (╰_╯)#' }
      else
        format.html { redirect_to items_path, notice: '失败...联系系统管理员吧 ╮(╯▽╰)╭' }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: '删除成功，你又一次为世界的和平做了贡献 莔rz' }
      format.json { head :no_content }
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
