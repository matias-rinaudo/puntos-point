module Buys
  class GetThreeProductsWithTheMostProfit < Buys::Base
    def get_products
      {
        categories: @categories.map do |category|
          {
            name: category.name,
            products: products(category).map do |product|
              {
                name: Product.find(product[0]).name,
                total_profit: product[1] * Product.find(product[0]).price
              }
            end
          }
        end
      }
    end

    private

    def products(category)
      Buy.get_three_products_with_the_most_profit_by_category(category)
    end
  end
end