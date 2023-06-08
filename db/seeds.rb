require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning up database..."
Pet.destroy_all
User.destroy_all
Booking.destroy_all
Review.destroy_all
puts "Database cleaned"

juliette = User.create!(email: "walkyourdog.user@gmail.com", password: "secret", name: "Juliette")
tom = User.create!(email: "what.a.email.@gmail.com", password: "secret", name: "Tom")
chris = User.create!(email: "guywholovesdogs@gmail.com", password: "secret", name: "Chris")
safia = User.create!(email: "example@gmail.com", password: "secret", name: "Safia")
nurra = User.create!(email: "example.example@gmail.com", password: "secret", name: "Nurra")

bella_file = URI.open("https://source.unsplash.com/random/?dog")
bella = Pet.new(name: "Bella", availability: true, breed: "poodle", description: "From cuddles on the couch to infinite (sometimes slobbery) kisses and more, there is something extra special about a dog’s love. No matter what, our dogs are always there for us. Who else will wait by the door and await our arrival as they wag their tails gleefully?From cuddles on the couch to infinite (sometimes slobbery) kisses and more, there is something extra special about a Bella love. No matter what, our dog is always there for us. Who else will wait by the door and await our arrival as she wags her tail gleefully?")
bella.user = juliette
bella.photo.attach(io: bella_file, filename: "bella.png", content_type: "image/png")
bella.save

max_file = URI.open("https://images.unsplash.com/photo-1582456891925-a53965520520?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80")
max = Pet.new(name: "Max", availability: true, breed: "labrador", description: "super loyal, don't like to run")
max.user = tom
max.photo.attach(io: max_file, filename: "max.png", content_type: "image/png")
max.save

luna_file = URI.open("https://images.unsplash.com/photo-1518717758536-85ae29035b6d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZG9nc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")
luna = Pet.new(name: "Luna", availability: false, breed: "golden retriever", description: "yound and super athletic")
luna.user = chris
luna.photo.attach(io: luna_file, filename: "luna.png", content_type: "image/png")
luna.save

cooper_file = URI.open("https://images.unsplash.com/photo-1518378188025-22bd89516ee2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGRvZ3N8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60")
cooper = Pet.new(name: "Cooper", availability: true, breed: "bulldog", description: "very social ! Cooper loves others dogs")
cooper.user = safia
cooper.photo.attach(io: cooper_file, filename: "cooper.png", content_type: "image/png")
cooper.save

daisy_file = URI.open("https://source.unsplash.com/fr/photos/795upe4hZRw")
daisy = Pet.new(name: "Daisy", availability: false, breed: "german sheperd", description: "Daisy is super kind, she loves walking under rain")
daisy.user = nurra
daisy.photo.attach(io: daisy_file, filename: "daisy.png", content_type: "image/png")
daisy.save

# Seed for bookings
a = Booking.new(start_date: "2023-08-01", end_date: "2023-08-05", booking_date: "2023-06-20", status: "pending")
a.pet = bella
a.user = tom
a.save

b = Booking.new(start_date: "2021-08-01", end_date: "2021-08-05", booking_date: "2023-06-20", status: "pending")
b.pet = max
b.user = juliette
b.save

c = Booking.new(start_date: "2021-08-01", end_date: "2021-08-05", booking_date: "2023-06-20", status: "pending")
c.pet = luna
c.user = chris
c.save

d = Booking.new(start_date: "2021-08-01", end_date: "2021-08-05", booking_date: "2023-06-20", status: "pending")
d.pet = cooper
d.user = safia
d.save

e = Booking.new(start_date: "2021-08-01", end_date: "2021-08-05", booking_date: "2023-06-20", status: "pending")
e.pet = daisy
e.user = nurra
e.save

# create reviews
review_a = Review.new(comment: "Bella is a very good dog, she is very kind and she loves to play with other dogs", rating: 5)
review_a.booking = a
review_a.pet = a.pet
review_a.save!

review_b = Review.new(comment: "Max is a very good dog, he is very kind and he loves to play with other dogs", rating: 5)
review_b.booking = b
review_b.pet = b.pet
review_b.save!

review_c = Review.new(comment: "Luna is a very good dog, she is very kind and she loves to play with other dogs", rating: 5)
review_c.booking = c
review_c.pet = c.pet
review_c.save!

review_d = Review.new(comment: "Cooper is a very good dog, he is very kind and he loves to play with other dogs", rating: 5)
review_d.booking = d
review_d.pet = d.pet
review_d.save!

review_e = Review.new(comment: "Daisy is a very good dog, she is very kind and she loves to play with other dogs", rating: 5)
review_e.booking = e
review_e.pet = e.pet
review_e.save!

puts "Finished!"
