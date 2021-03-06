module SessionsHelper
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
  
  
  
  def sign_in(user)
    remember_token = User.new_remember_token
  #  cookies.permanent[:remember_token] = remember_token
    cookies[:remember_token] = { value: remember_token, expires: 8.hour.from_now }
    
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
  end
  
  
  
   def sign_out
    current_user.update_attribute(:remember_token,
                                  User.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
    session.delete(:return_to)
  end

  
  
  def current_user=(user)
    @current_user = user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  
  def current_user?(user)
    user == current_user
  end
  
  private
  
  def admin_user 
     unless current_user.admin?
        flash[:notice] = "Brak uprawnień"
        redirect_to(root_url) 
      end
  end
  
  def kiera_user 
     unless current_user.kiera?
        flash[:notice] = "Brak uprawnień"
        redirect_to(root_url) 
      end
  end
  
  
  def admin_kiera_user 
     unless (current_user.kiera? || current_user.admin?)
        flash[:notice] = "Brak uprawnień"
        redirect_to(root_url) 
      end
  end

  def signed_in_user
      unless signed_in?
        flash[:notice] = "Zaloguj się..."
        store_location
        redirect_to signin_url
      end
   end
end
