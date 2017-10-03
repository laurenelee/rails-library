# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
authors = [
  {
    name: "Margot Lee Shetterly",
    nationality: "unknown"
  },
  {
    name: "Sandi Metz",
    nationality: "USA"
  },
  {
    name: "Octavia E. Butler",
    nationality: "USA"
  }
]

authors.each do |author|
  books = author.delete(books)

  a = Author.create!(author)
  puts "Author: #{a.inspect}"
end

puts "Created #{Author.count} authors"
