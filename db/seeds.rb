# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! name: "Eins",
  email: "user@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  phone: "01675899424",
  address: "Neifheim"

Staff.create! name: "Zwei",
  email: "zwei@gmail.com",
  password: "111111",
  password_confirmation: "111111",
  position: "1"
