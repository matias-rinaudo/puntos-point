admin = User.create!(email: 'rinaudom96@gmail.com' , password: '123456' , password_confirmation: '123456', access_level: :admin,
                     first_name: 'Matias', middle_name: 'Sebastian', last_name: 'Rinaudo')

clothes_category = Category.create!(name: 'Ropa')
gardening_category = Category.create!(name: 'Jardineria')

product_1 = Product.create!(name: 'Campera', description: 'campera roja de cuero', price: 12000)
product_2 = Product.create!(name: 'Buzo', description: 'buzo negro de cuero', price: 20000)
product_3 = Product.create!(name: 'Pala', price: 10000)
product_4 = Product.create!(name: 'Rastrillo', price: 50000)

product_1.categories << clothes_category
product_1.save

product_2.categories << clothes_category
product_2.save

product_3.categories << gardening_category
product_3.save

product_4.categories << gardening_category
product_4.save
