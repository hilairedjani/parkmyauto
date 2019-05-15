# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seeding

    User.all.each do |user|
        2.times do 
            count = 1
            user.vehicles.create(license_plate: "#{user.id}_vehic_#{count}", make: "Toyota")
        end
    end
end

seeding