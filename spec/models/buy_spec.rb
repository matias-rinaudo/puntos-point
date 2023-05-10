require 'rails_helper'

RSpec.describe Buy, type: :model do
  let(:day) { DateTime.now }
  let(:product) { build :product }
  let(:product_ids) { [4] }
  let(:customer) { build :customer }
  let!(:buy_1) { create(:buy, customer: customer, product: product) }
  let!(:buy_2) { create(:buy, customer: customer, product: product) }
  let(:date_from) { DateTime.now - 1 }
  let(:date_to) { DateTime.now }

  describe 'associations' do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to belong_to(:product) }
  end

  describe 'scopes' do
    describe '.by_day' do
      subject { Buy.by_day(day).to_a }

      it "return buys by day" do
        is_expected.to match_array [buy_1, buy_2]
      end
    end

    describe '.by_products' do
      subject { Buy.by_products(product_ids).to_a }

      it "return buys by_products" do
        is_expected.to match_array [buy_1, buy_2]
      end
    end

    describe '.by_range_date' do
      subject { Buy.by_range_date(date_from, date_to).to_a }

      it "return buys by_range_date" do
        is_expected.to match_array [buy_1, buy_2]
      end
    end

    describe '.by_customer_id' do
      subject { Buy.by_customer_id(customer.id).to_a }

      it "return buys by_customer_id" do
        is_expected.to match_array [buy_1, buy_2]
      end
    end
  end
end