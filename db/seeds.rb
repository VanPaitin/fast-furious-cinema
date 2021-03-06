# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

puts "Creating admin user..."
AdminUser.create!(email: 'admin@example.com', password: ENV['ADMIN_PASSWORD'])
puts 'Admin user successfully created!'

puts 'Seeding movies'
Movie.create!(title: 'The Fast and the Furious', imdb_id:	'tt0232500')
Movie.create!(title: '2 Fast 2 Furious', imdb_id:	'tt0322259')
Movie.create!(title: 'The Fast and the Furious: Tokyo Drift', imdb_id:	'tt0463985')
Movie.create!(title: 'Fast & Furious', imdb_id:	'tt1013752')
Movie.create!(title: 'Fast Five', imdb_id:	'tt1596343')
Movie.create!(title: 'Fast & Furious 6', imdb_id:	'tt1905041')
Movie.create!(title: 'Furious 7', imdb_id:	'tt2820852')
Movie.create!(title: 'The Fate of the Furious', imdb_id:	'tt4630562')
puts 'Movies successfully seeded!'
