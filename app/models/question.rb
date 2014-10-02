class Question < ActiveRecord::Base
  validates :desctiption, presence: true
  validates :strength, presence: true
  validates :cancelled, presence: true
  
end
