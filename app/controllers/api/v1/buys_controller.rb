class Api::V1::BuysController < ApplicationController 
  before_action :authenticate_request
  before_action :set_buy, only: %i[ show update destroy ]

  # GET /buys
  def index
    product_ids = params[:category_id].present? ? Category.find(params[:category_id]).products.ids : Product.all.ids  
    customer_id = Customer.find(params[:customer_id])

    Rails.cache.fetch("all_buys", expires_in: 2.hours) do
      @buys = Buy.by_range_date(params[:date_from], params[:date_to]).by_products(product_ids).by_customer_id(customer_id)
    end

    render json: {buys: @buys}
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

  def get_total_buys_by_granularity
    product_ids = params[:category_id].present? ? Category.find(params[:category_id]).products.ids : Product.all.ids  
    customer_id = Customer.find(params[:customer_id])

    @buys = Buy.by_range_date(params[:date_from], params[:date_to]).by_products(product_ids).by_customer_id(customer_id).group("DATE_TRUNC('#{params[:granularity]}', created_at)")

    case params[:granularity]
    when 'hour'
      @buys = @buys.count.transform_keys {|d| d.strftime('%m/%d/%y %T') }
    when 'day'
      @buys = @buys.count.transform_keys {|d| d.strftime('%m/%d/%y') }
    when 'week'
      @buys = @buys.count.transform_keys {|d| d.strftime('%m/%d/%y') }
    when 'year'
      @buys = @buys.count.transform_keys {|d| d.strftime('%Y') }
    end

    @total_buys = {
      buys: @buys.map do |buy|
        {
          date: buy[0],
          total: buy[1]
        }
      end
    }

    Rails.cache.fetch("total_buys", expires_in: 2.hours) do
      @total_buys
    end

    render json: @total_buys
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

