class Parameter < ActiveRecord::Base
  validates :us_regon, presence: true, format: { with: /\A[\d]{9}\z/i }
  validates :us_nip, presence: true, format: { with: /\A[\d]{10}\z/i }
  validates :us_code, presence: true, format: { with: /\A[\d]{4}\z/i }
  validates :us_name, presence: true
  validates :us_street, presence: true
  validates :us_city, presence: true
  validates :us_house, presence: true 
  validates :us_www, presence: true
  validates :us_tel, presence: true  
  validates :us_fax, presence: true 
end


