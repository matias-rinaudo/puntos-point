class BuyMailer < ApplicationMailer
  def first_buy(buy)
    @buy = buy
    mail(:to => '', :subject => "Felicitaciones por tu venta.")
  end

  def daily_report(products)
    @products = products
    @admin_emails = User.admin.map(&:email)
    mail(:to => @admin_emails, :subject => "Reporte diario.")
  end
end
