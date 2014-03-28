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
    users = User.all(limit: 6)
    5.times do
      address = Faker::Address.street_address(include_secondary = false)
      city = Faker::Address.city
      state = Faker::Address.state_abbr
      zip = Faker::Address.zip_code
      description = Faker::Lorem.paragraph(sentence_count = 4)
      price = 123000
      beds = 3
      baths = 2
      home_size = 1200
      lot_size = 7900
      year_built = 1958
      users.each { |user| user.tours.create!(address: address, 
                                             city: city,
                                             state: state,
                                             zip: zip,
                                             description: description,
                                             price: price,
                                             beds: beds,
                                             baths: baths,
                                             home_size: home_size,
                                             lot_size: lot_size,
                                             year_built: year_built) }
    end
  end
end