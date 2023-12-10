# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# User.create!(name: 'abdul', email: 'manager@mail.com', password: '11223344', password_confirmation: '11223344', usertype: 'manager') if Rails.env.development?

User.create!([
{name: "abdul",email: "abdul@mail.com", password: '11223344', password_confirmation: '11223344', usertype: 'manager'},
{name: "awais",email: "awais@mail.com", password: '11223344', password_confirmation: '11223344', usertype: 'developer'},
{name: "naveed",email: "naveed@mail.com", password: '11223344', password_confirmation: '11223344', usertype: 'developer'},
{name: "toseef",email: "toseef@mail.com", password: '11223344', password_confirmation: '11223344', usertype: 'developer'},
{name: "ansar",email: "ansar@mail.com", password: '11223344', password_confirmation: '11223344', usertype: 'developer'},
{name: "nasir",email: "nasir@mail.com", password: '11223344', password_confirmation: '11223344', usertype: 'qa'},
{name: "tahir",email: "tahir@mail.com", password: '11223344', password_confirmation: '11223344', usertype: 'qa'},
])