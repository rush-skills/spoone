# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.
address = ["Okhla","Dhaula Kuan","Lajpat Nagar","Rohini","Dwarka"]
10.times do |x|
  img = "http://loremflickr.com/g/320/240/girl?random="+x.to_s
  User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "password", password_confirmation: "password", remote_image_url: img)
end
users = User.all
ratings = Array(1..5)
5.times do |x|
  add = address[x]+", Delhi"
  img = "http://loremflickr.com/1000/300/cat?random="+x.to_s
  r = Restaurant.create!(name: Faker::Company.name, address: add ,remote_image_url: img)
  10.times do
    Review.create!(user: users.sample, widget: r.review_widget, text: Faker::Hacker.say_something_smart, rating: ratings.sample)
  end
  3.times do  |x|
    img = "http://loremflickr.com/1000/1500/paris?random="+x.to_s
    Menu.create!(widget: r.menu_widget,remote_image_url: img)
  end
  names = Swidget.names
  names.each do |x|
    w = Widget.create(restaurant: r, half: false, widget_klass: "swidget")
    Swidget.create(name: x, widget: w)
  end
  w = Widget.create(restaurant: r, half: false, widget_klass: "text")
  Text.create(name: "Annoucement",text: "ENJOY LIVE DJ TODAY WITH HUGE DISCOUNTS!", widget: w)
end
