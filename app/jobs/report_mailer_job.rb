class ReportMailerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    products = Buy.by_day(Date.today - 1).group(:product_id).size

    BuyMailer.daily_report(products).deliver_now
  end
end
