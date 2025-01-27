# db/seeds.rb

# Only create an admin if there are no users
unless User.exists?
  admin = User.create!(
    email: 'admin@example.com', 
    password: 'admin123', 
    password_confirmation: 'admin123',
    role: 'admin'
  )
  puts "Admin user created with email: admin@example.com and password: admin123"
else
  puts "Admin already exists."
end
