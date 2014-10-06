namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(login: "adm",
                 forename: "admin", 
                 name: "admin",
                 email: "admin@wp.pl",
                 password: "test1234",
                 password_confirmation: "test1234",
                 admin: true)
    User.create!(login: "dmu",
                 forename: "Dariusz",
                 name: "Murawski",
                 email: "darek@wp.pl",
                 password: "test1234",
                 password_confirmation: "test1234",
                 admin: true)
    User.create!(login: "nad1",
                 forename: "nie-admin1",
                 name: "nie-admin1",
                 email: "nie-admin1@wp.pl",
                 password: "test1234",
                 password_confirmation: "test1234")
    User.create!(login: "nad2",
                 forename: "nie-admin2",
                 name: "nie-admin2",
                 email: "nie-admin2@wp.pl",
                 password: "test1234",
                 password_confirmation: "test1234")
                 
                 
    Question.create!(description: "pytanie1",
                     strength: 1)                                  
    Question.create!(description: "pytanie2",
                     strength: 2)   
                     
                     
    Level.create!(description: "NISKI",
                     value: 20)
    Level.create!(description: "WYSOKI",
                     value: 50)               
                     
                     
                                                
                 
  end
end