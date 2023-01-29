# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    #user = User.new
    #user.email = "ro@ru.com"
    #user.pseudo = "ro ru"
    #user.admin = true
    #user.password = 123456
    #user.save!

    user = User.new
    user.email = "guest@general.com"
    user.pseudo = "guest general"
    #user.admin = true
    user.password = 123456
    user.save!

    user = User.new
    user.email = "guest@admin.com"
    user.pseudo = "guest admin"
    user.admin = true
    user.password = 123456
    user.save!

    

# 4.times do |j|
#    product = Product.new
#    product.price = 1000 + j
#    product.description = "description#{j+1}"
#    product.user_id = User.find(j+1).id
#    product.save
# end
# 4.times do |j|
 #   message = Message.new
 #   message.email = "visit#{j+1}@gmail.com"
 #   message.messages = "messages#{j+1}"
 #   message.user_id = User.find(j+1).id
 #   message.save
 #end
