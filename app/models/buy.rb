class Buy < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  after_create :send_email_first_buy

  scope :by_day, ->(day) {where("DATE(created_at) = ?", day)}
  scope :by_products, ->(product_ids) {where(product_id: product_ids)}
  scope :by_range_date, -> date_from, date_to {where(created_at: date_from.to_datetime..date_to.to_datetime)}
  scope :by_customer_id, -> (customer_id) {where(customer_id: customer_id)}

  def self.most_purchased_products_by_category(category)
    Rails.cache.fetch("most_purchased_products_by_category", :expires_in => 1.hour) do
      Buy.joins(:product).by_products(category.products.ids).group('buys.product_id, product_id').size.sort_by {|_key, value| -value}
    end
  end

  private

  def send_email_first_buy
    BuyMailer.first_buy(self).deliver_now unless Buy.where(product_id: self.product.id).exists?
  end
end
