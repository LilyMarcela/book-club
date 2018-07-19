# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Users=[{email:"gabriel@gmail.com", password:"123456"},{email:"pop90@gmail.com" ,password:"123456"},{email:"rosacolo@gmail.com" ,password:"123456"},{email:"maroon@gmail.com", password:"123456"}]
Books=[{title: "Dulceagrio",author:"Stephanie Danler",url_file:"http://aristobulo.psuv.org.ve/wp-content/uploads/2008/10/garcia-marquez-gabriel-cien-anos-de-soledad1.pdf",owner_id: 1},{title: "Cien años de soledad",author:"Gabriel Garcia Marques",url_file:"http://aristobulo.psuv.org.ve/wp-content/uploads/2008/10/garcia-marquez-gabriel-cien-anos-de-soledad1.pdf",owner_id: 2},{title: "HTML and CSS",author:"Jon Duckett",url_file:"http://aristobulo.psuv.org.ve/wp-content/uploads/2008/10/garcia-marquez-gabriel-cien-anos-de-soledad1.pdf",owner_id: 2},{title: "Harry potter Caliz de fuego",author:"J. K. ROWLING",url_file: "http://aristobulo.psuv.org.ve/wp-content/uploads/2008/10/garcia-marquez-gabriel-cien-anos-de-soledad1.pdf" ,
  owner_id: 2},{title: "Cuentos de buenas noches para ninas rebeldes 2",author:"FRANCESCA CAVALLO Y ELENA FAVILLI",url_file:"http://aristobulo.psuv.org.ve/wp-content/uploads/2008/10/garcia-marquez-gabriel-cien-anos-de-soledad1.pdf", owner_id: 3}]

Categories=[{ name: "Drama"},{name: "Computers"},{name: "Fiction"},{name: "Mistery"},{name: "Suspense"},{name: "Soup Opera"},{name: "Romantic"},{name: "Bibliografica"}]

Categories.each do |category|

   Category.create(name: category[:name])
end
Books.each do |book|
    Book.create(title: book[:title],author: book[:author],owner_id: book[:owner_id])
end

Users.each do |user|
    User.create(email: user[:email], password: user[:password])
end
