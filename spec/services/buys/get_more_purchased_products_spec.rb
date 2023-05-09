require 'rails_helper'

RSpec.describe Buys::GetMorePurchasedProducts, type: :service do
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
                            "total_buys" => 5
                        },
                        {
                            "name" => "Buzo",
                            "total_buys" => 4
                        },
                        {
                            "name" => "Medias",
                            "total_buys" => 3
                        },
                        {
                            "name" => "Pantalon",
                            "total_buys" => 2
                        }
                    ]
                },
                {
                    "name" => "Jardineria",
                    "products" => [
                        {
                            "name" => "Campera",
                            "total_buys" => 5
                        },
                        {
                            "name" => "Buzo",
                            "total_buys" => 4
                        },
                        {
                            "name" => "Medias",
                            "total_buys" => 3
                        },
                        {
                            "name" => "Pantalon",
                            "total_buys" => 2
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
