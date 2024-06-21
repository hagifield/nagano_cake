class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新規商品を作成しました"
      redirect_to item_path(@item.id)
    else
      @item = Item.new
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end

end
