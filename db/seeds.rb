# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create!(email: "admin@admin.com", password: 123456, name: "admin", role: "admin")
u1 = User.create!(email: "user@user.com", password: 123456, name: "user", role: "user")
u2 = User.create!(email: "user2@user.com", password: 123456, name: "user2", role: "user")
u3 = User.create!(email: "user3@user.com", password: 123456, name: "user3", role: "user")


songs = ["musica1","musica2","musica3","musica4","musica5","musica6"]

songs.each do |s|
  Song.create!(title: s, artist: "artist", user_id: u1.id)
end

