FactoryGirl.define do
  factory :user do
    sequence(:login)  { |n| "L_#{n}" }
    sequence(:forename)  { |n| "Imię #{n}" }
    sequence(:name)  { |n| "Nazwisko #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
  
  
  factory :question do
    description "pytanie 1"
    strength 5
  end

  
  
  factory :level do
    description "NISKI"
    value 20
  end
  


  
  
end