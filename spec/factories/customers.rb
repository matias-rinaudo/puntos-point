FactoryBot.define do
  factory :customer, class: 'Customer' do
    first_name { 'Juan' }
    last_name { 'Perez' }
    email { 'juan_perez@gmail.com' }
  end
end