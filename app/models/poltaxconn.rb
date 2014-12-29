class Poltaxconn < ActiveRecord::Base
  attr_encrypted :password, :key => 'losowy klucz'
  
  
  validates :database, presence: true, format: { with: /^[\d]{1,3}.[\d]{1,3}.[\d]{1,3}.[\d]{1,3}$/i ,:multiline => true}
  validates :username, presence: true
  validates :password, presence: true 
 # { with: /^[\d][\d]-[\d][\d][\d]$/i ,:multiline => true}
end
