# db/seeds.rb

# Create an admin user with a default email and password
admin = User.create!(
  email: "admin@gmail.com",
  password: "admin123",
  password_confirmation: "admin123",
  role: "admin"
)

puts "Admin user created with email: admin@gmail.com and password: admin123"
