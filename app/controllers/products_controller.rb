class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    product = Product.create(product_params)
    if product.valid?
      redirect_to products_path
    else
      render :new
    end
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end
  private
    def product_params
      params.require(:product).permit(:name, :description, :inventory, :price)
    end
end
