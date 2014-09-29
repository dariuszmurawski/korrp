namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "admin",
                 email: "admin@wp.pl",
                 password: "test1234",
                 password_confirmation: "test1234",
                 admin: true)
    User.create!(name: "Dariusz Murawski",
                 email: "darek@wp.pl",
                 password: "test1234",
                 password_confirmation: "test1234",
                 admin: true)
    User.create!(name: "nie-admin1",
                 email: "nie-admin1@wp.pl",
                 password: "test1234",
                 password_confirmation: "test1234")
    User.create!(name: "nie-admin2",
                 email: "nie-admin2@wp.pl",
                 password: "test1234",
                 password_confirmation: "test1234")
  end
end