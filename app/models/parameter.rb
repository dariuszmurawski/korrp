class Parameter < ActiveRecord::Base
  validates :us_regon, presence: true, format: { with: /^[\d]{9}$/i ,:multiline => true},length: {minimum: 9,maximum: 9}
  validates :us_nip, presence: true, format: { with: /^[\d]{10}$/i ,:multiline => true},length: {minimum: 10,maximum: 10}
  validates :us_code, presence: true, format: { with: /^[\d]{4}$/i ,:multiline => true},length: {minimum: 4,maximum: 4}
  validates :us_name, presence: true
  validates :us_street, presence: true
  validates :us_city, presence: true
  validates :us_house, presence: true 
  validates :us_www, presence: true
  validates :us_tel, presence: true  
  validates :us_fax, presence: true 
 # validates :us_postalcode, presence: true ,format: { with: /\A[\d][\d]-[\d][\d][\d]\z/i }
  validates :us_postalcode, presence: true ,format: { with: /^[\d][\d]-[\d][\d][\d]$/i,:multiline => true}
  
  VALID_EMAIL_REGEX =  /^\s*(([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})[\s\/,;]*)+$/i  
  validates :us_email, presence: true, 
                       format: { with: VALID_EMAIL_REGEX ,:multiline => true}
                    
end


