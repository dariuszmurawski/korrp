class Question < ActiveRecord::Base
  validates :description, presence: true,length: { maximum: 500 },uniqueness: { judge: :ignore }
  validates :strength, presence: true, numericality: { only_integer: true , less_than: 100}
 # validates :cancelled, presence: true
  default_scope -> { order('description') }
  
end
