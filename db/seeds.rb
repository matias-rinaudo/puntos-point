#Users
admin = User.create!(email: 'rinaudom96@gmail.com' , password: '123456' , password_confirmation: '123456', access_level: :admin,
                     first_name: 'Matias', middle_name: 'Sebastian', last_name: 'Rinaudo')
operations = User.create!(email: 'operations@operations.com' , password: '123456' , password_confirmation: '123456', access_level: :operations,
                     first_name: 'User', last_name: 'Operations')
customer = Customer.create(first_name: 'Juan', last_name: 'Perez', email: 'juan_perez@gmail.com')

#Categories
clothes_category = Category.create!(name: 'Ropa')
gardening_category = Category.create!(name: 'Jardineria')

#Products
product_1 = Product.create!(name: 'Campera', description: 'campera roja de cuero', price: 12000)
product_2 = Product.create!(name: 'Buzo', description: 'buzo negro de cuero', price: 20000)
product_3 = Product.create!(name: 'Pala', price: 10000)
product_4 = Product.create!(name: 'Rastrillo', price: 50000)
product_5 = Product.create!(name: 'Pantalon', price: 20000)
product_6 = Product.create!(name: 'Maceta', price: 1000)
product_7 = Product.create!(name: 'Medias', price: 2000)
product_8 = Product.create!(name: 'Tierra', price: 1500)

product_1.categories << clothes_category
product_1.save

product_2.categories << clothes_category
product_2.save

product_3.categories << gardening_category
product_3.save

product_4.categories << gardening_category
product_4.save

product_5.categories << clothes_category
product_5.save

product_6.categories << gardening_category
product_6.save

product_7.categories << clothes_category
product_7.save

product_8.categories << gardening_category
product_8.save

#Buys
buy_1 = Buy.create!(product_id: product_1.id, customer_id: customer.id)
buy_2 = Buy.create!(product_id: product_2.id, customer_id: customer.id)
buy_3 = Buy.create!(product_id: product_1.id, customer_id: customer.id)
buy_4 = Buy.create!(product_id: product_3.id, customer_id: customer.id)
buy_5 = Buy.create!(product_id: product_4.id, customer_id: customer.id)
buy_6 = Buy.create!(product_id: product_2.id, customer_id: customer.id)
buy_7 = Buy.create!(product_id: product_4.id, customer_id: customer.id)
buy_8 = Buy.create!(product_id: product_1.id, customer_id: customer.id)
buy_9 = Buy.create!(product_id: product_3.id, customer_id: customer.id)
buy_10 = Buy.create!(product_id: product_3.id, customer_id: customer.id)
buy_11 = Buy.create!(product_id: product_1.id, customer_id: customer.id)
buy_12 = Buy.create!(product_id: product_1.id, customer_id: customer.id)
buy_13 = Buy.create!(product_id: product_4.id, customer_id: customer.id)
buy_14 = Buy.create!(product_id: product_2.id, customer_id: customer.id)
buy_15 = Buy.create!(product_id: product_5.id, customer_id: customer.id)
buy_16 = Buy.create!(product_id: product_5.id, customer_id: customer.id)
buy_17 = Buy.create!(product_id: product_6.id, customer_id: customer.id)
buy_18 = Buy.create!(product_id: product_7.id, customer_id: customer.id)
buy_19 = Buy.create!(product_id: product_7.id, customer_id: customer.id)
buy_20 = Buy.create!(product_id: product_7.id, customer_id: customer.id)
buy_21 = Buy.create!(product_id: product_8.id, customer_id: customer.id)
buy_22 = Buy.create!(product_id: product_2.id, customer_id: customer.id)
buy_23 = Buy.create!(product_id: product_3.id, customer_id: customer.id)
buy_24 = Buy.create!(product_id: product_6.id, customer_id: customer.id)
buy_25 = Buy.create!(product_id: product_8.id, customer_id: customer.id)
buy_25 = Buy.create!(product_id: product_8.id, customer_id: customer.id)
buy_25 = Buy.create!(product_id: product_8.id, customer_id: customer.id)
buy_25 = Buy.create!(product_id: product_8.id, customer_id: customer.id)