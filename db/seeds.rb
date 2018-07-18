# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Users=[{email:"gabriel@gmail.com" password:"123456"},{email:"pop90@gmail.com" password:"123456"},{email:"rosacolo@gmail.com" password:"123456"},{email:"maroon@gmail.com" password:"123456"}]
Books=[{title: "Dulceagrio",author:"Stephanie Danler"}]

Categories=[{name:"Drama"}, {name:"Computers"},{name:"Fiction"},{name:"Mistery"},{name:"Suspense"},{name:"Soup Opera"},{name:"Romantic"},{name: "Bibliografica"}]
Books=[]
Categories.each do |category|
   Category.create (name:category.name);
end
