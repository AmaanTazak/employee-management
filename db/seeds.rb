# db/seeds.rb

# Create an admin user with a default email and password
admin = User.create!(
  email: "admin@gmail.com",
  password: "admin123", 
  password_confirmation: "admin123",
  role: "admin"
)

puts "Admin user created with email: admin@example.com and password: password123"
