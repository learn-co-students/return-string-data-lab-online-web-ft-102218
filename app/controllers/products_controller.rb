class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory > 0
      render plain: 'true'
    else
      render plain: 'false'
    end
  end

  def new
    @product = Product.new
  end

  def create
    name = params['product']['name']
    desc = params['product']['description']
    price = params['product']['price'].to_i
    inv = params['product']['inventory'].to_i
    Product.create(name: name, description: desc, price: price, inventory: inv)
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory)
  end
end
