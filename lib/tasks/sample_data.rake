namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name:      "Mark Foster",
                 email:     "foster154@gmail.com",
                 phone:     "208-220-4905",
                 company:   "TourApp",
                 user_url:  "http://www.tourapp.com",
                 password:  "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@tourapp.org"
      company = Faker::Company.name
      phone = Faker::PhoneNumber.phone_number
      password  = "password"
      url = Faker::Internet.url
      User.create!(name: name,
                   email: email,
                   phone: phone,
                   company: company,
                   user_url: url,
                   password: password,
                   password_confirmation: password)
    end
  end
end