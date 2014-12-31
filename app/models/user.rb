class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_save { self.login = login.upcase }
  before_create :create_remember_token
  
  validates :login, presence: true, length: { maximum: 6 }, uniqueness: { case_sensitive: false ,judge: :ignore }  
  validates :forename, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 50 }
  
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_EMAIL_REGEX =  /^\s*(([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})[\s\/,;]*)+$/i  
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX ,:multiline => true},
                    uniqueness: { case_sensitive: false,judge: :ignore }
  has_secure_password
  validates :password, length: { minimum: 6 }, :if => :password

  default_scope -> { order('login') }
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def update_attributes_with_conflict(*args)
    update_attributes(*args)
    
    
    rescue ActiveRecord::StaleObjectError
      errors.add :base, "w trakcie edycji rekord został zmodyfikowany przez innego użytkownika"
      changes.except("updated_at","lock_version").each do |name, values|
        errors.add name, "aktualnie ma wartość: #{values.first}"
      end
    false
  end
  
  
  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

  
end
