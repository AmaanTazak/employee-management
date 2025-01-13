# db/seeds.rb

# Create an admin user with a default email and password
admin = User.create!(
  email: "admin@example.com",
  password: "password123", 
  password_confirmation: "password123",
  role: "admin"
)

puts "Admin user created with email: admin@example.com and password: password123"
