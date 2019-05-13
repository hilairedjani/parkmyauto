# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_users
    user_id = 0
    10.times do
        User.create(
            first_name: "test#{user_id}",
            last_name: "test#{user_id}",
            email: "test#{user_id}@test.com",
            password: "123456",
            password_confirmation: "123456",
        )
        user_id += 1
    end
end

def seed_vehicles 
    users = User.all

    users.each do |user|
        2.times do
            Vehicle.create(
                license_plate: "1234#{user.id}",
                make: "toyota#{user.id}",
                user_id: user.id
            )
        end
    end
end

seed_users
seed_vehicles