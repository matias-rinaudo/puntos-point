require 'rails_helper'

RSpec.describe Buys::GetThreeProductsWithTheMostProfit, type: :service do
  Rails.application.load_seed
  subject {described_class.new(categories: Category.all)}

  describe '#get_products' do
    context 'return list products' do
      let(:response) {subject.get_products}
      let(:expected_response) do
        {
            "categories" => [
                {
                    "name" => "Ropa",
                    "products" => [
                        {
                            "name" => "Campera",
                            "total_profit" => "72000.0"
                        },
                        {
                            "name" => "Buzo",
                            "total_profit" => "80000.0"
                        },
                        {
                            "name" => "Medias",
                            "total_profit" => "6000.0"
                        }
                    ]
                },
                {
                    "name" => "Jardineria",
                    "products" => [
                        {
                            "name" => "Campera",
                            "total_profit" => "72000.0"
                        },
                        {
                            "name" => "Buzo",
                            "total_profit" => "80000.0"
                        },
                        {
                            "name" => "Medias",
                            "total_profit" => "6000.0"
                        }
                    ]
                }
            ]
        }
      end
      it 'return expected response' do
        expect(response).to eq(expected_response)
      end
    end
  end
end
