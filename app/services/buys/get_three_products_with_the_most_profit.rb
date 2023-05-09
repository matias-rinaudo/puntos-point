module Buys
  class GetThreeProductsWithTheMostProfit < Buys::Base
    def get_products
      {
        categories: @categories.map do |category|
          {
            name: category.name,
            products: Buy.most_purchased_products_by_category(category).first(3).map do |product|
              {
                name: Product.find(product[0]).name,
                total_profit: product[1] * Product.find(product[0]).price
              }
            end
          }
        end
      }
    end
  end
end