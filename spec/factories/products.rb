FactoryBot.define do
  factory :product, class: 'Product' do
    name { 'Pala' }
    price { 10000 }
    description { nil }
  end
end