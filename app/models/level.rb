class Level < ActiveRecord::Base
  validates :value, presence: true,uniqueness: true, numericality: { only_integer: true , less_than: 100}
  validates :description, presence: true
  
  
  
  
  
  default_scope -> { order('value') }
  
end
