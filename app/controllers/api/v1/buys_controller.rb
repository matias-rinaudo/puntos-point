class Api::V1::BuysController < ApplicationController 
  before_action :authenticate_request
  before_action :set_buy, only: %i[ show update destroy ]

  # GET /buys
  def index
    @buys = Buy.all

    render json: @buys
  end

  # GET /buys/1
  def show
    render json: @buy
  end

  # POST /buys
  def create
    @buy = Buy.new(buy_params)

    if @buy.save
      render json: @buy, status: :created, location: @buy
    else
      render json: @buy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /buys/1
  def update
    if @buy.update(buy_params)
      render json: @buy
    else
      render json: @buy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /buys/1
  def destroy
    @buy.destroy
  end

  def most_purchased_products_by_category
    @products = Buys::GetMorePurchasedProducts.new(categories: Category.all).get_products

    render json: @products
  end

  def get_three_products_with_the_most_profit_by_category
    @products = Buys::GetThreeProductsWithTheMostProfit.new(categories: Category.all).get_products

    render json: @products
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy
      @buy = Buy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buy_params
      params.fetch(:buy, {})
    end
end

