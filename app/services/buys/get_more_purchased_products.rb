module Buys
  class GetMorePurchasedProducts < Buys::Base
    def get_products
      {
        categories: @categories.map do |category|
          {
            name: category.name,
            products: products(category).map do |product|
              {
                name: Product.find(product[0]).name,
                total_buys: product[1]
              }
            end
          }
        end
      }
    end

    private

    def products(category)
      Buy.most_purchased_products_by_category(category)
    end
  end
end