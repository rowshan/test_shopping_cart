class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :destroy]

  # GET /carts
  def index
    @carts = Cart.all
    render json: @carts


  end

  # GET /carts/1
  def show
    render json: @cart

  end

  # GET /carts/new
  def new
    @cart = Cart.new
    render json: @cart

  end


  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      render json: @carts
      redirect_to @cart, notice: @cart.product_name + ' was successfully created.'
    else
      render :new
    end
  end


  # DELETE /carts/1
  def destroy
    @cart.destroy
    redirect_to carts_url,  notice: @cart.product_name + ' was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params.require(:cart).permit(:product_name, :category)
    end
end
