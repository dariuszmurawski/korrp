class Parameter < ActiveRecord::Base
  validates :us_regon, presence: true, format: { with: /^[\d]{9}$/i ,:multiline => true, message: "zły format pola - powinno być 9 cyfr"}
  validates :us_nip, presence: true, format: { with: /^[\d]{10}$/i ,:multiline => true, message: "zły format pola - powinno być 10 cyfr"}
  validates :us_code, presence: true, format: { with: /^[\d]{4}$/i ,:multiline => true, message: "zły format pola - powinny być: 4 cyfry"}
  validates :us_name, presence: true
  validates :us_street, presence: true
  validates :us_city, presence: true
  validates :us_house, presence: true 
  validates :us_www, presence: true
  validates :us_tel, presence: true  
  validates :us_fax, presence: true 
 # validates :us_postalcode, presence: true ,format: { with: /\A[\d][\d]-[\d][\d][\d]\z/i }
  validates :us_postalcode, presence: true ,format: { with: /^[\d][\d]-[\d][\d][\d]$/i,:multiline => true, message: "zły format pola - powinno być: XX-XXX"}
  
  VALID_EMAIL_REGEX =  /^\s*(([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})[\s\/,;]*)+$/i  
  validates :us_email, presence: true, 
                       format: { with: VALID_EMAIL_REGEX ,:multiline => true}
                    
end


