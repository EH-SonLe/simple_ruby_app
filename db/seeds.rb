# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.find_or_create_by(email: "admin@example.com") do |u|
  u.username = "admin"
  u.password = "password123"
end

Article.find_or_create_by(title: "First article") do |a|
  a.description = "Description of first article"
  a.user_id = user.id
end

Article.find_or_create_by(title: "Second article") do |a|
  a.description = "Description of second article"
  a.user_id = user.id
end

Article.find_or_create_by(title: "Some fun article") do |a|
  a.description = "This article is a lot of fun"
  a.user_id = user.id
end
