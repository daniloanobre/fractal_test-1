# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
Category.delete_all
Supplier.delete_all
Place.delete_all

Category.create([
  { name: "Brinquedos", description: Faker::Lorem.paragraph },
  { name: "Filmes", description: Faker::Lorem.paragraph },
  { name: "Games", description: Faker::Lorem.paragraph },
  { name: "Ação", description: Faker::Lorem.paragraph },
  { name: "Eletrônicos", description: Faker::Lorem.paragraph },
  { name: "Educação", description: Faker::Lorem.paragraph }
])

Supplier.create([
  { company_name: "Estrela", email: ENV["SMTP_EMAIL"] },
  { company_name: "Disney", email: Faker::Internet.email },
  { company_name: "Valve", email: Faker::Internet.email }
])

Place.create([
  { hall: "4", shelf: Faker::StarWars.droid },
  { hall: "5B", shelf: Faker::StarWars.droid },
  { hall: "2", shelf: Faker::StarWars.droid }
])

action_games = Category.where(name: ["Games", "Eletrônicos", "Ação"]).collect(&:id)
educative_movies = Category.where(name: ["Filmes", "Educação"]).collect(&:id)
educative_toys = Category.where(name: ["Brinquedos", "Educação"]).collect(&:id)

100.times do
  Product.create([
    { name: Faker::Beer.name, supplier: Supplier.find_by(company_name: "Estrela"), place: Place.find_by(hall: "5B"), category_ids: educative_toys },
    { name: Faker::Beer.name, supplier: Supplier.find_by(company_name: "Valve"), place: Place.find_by(hall: "4"), category_ids: action_games },
    { name: Faker::Beer.name, supplier: Supplier.find_by(company_name: "Disney"), place: Place.find_by(hall: "2"), category_ids: educative_movies }
  ])
end
