class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :index, :destroy, :create, :new]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy, :index, :create, :new]
  
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
 
 
  
#  def create
#    @user = User.new(user_params)
#    if @user.save
#      sign_in @user
#      flash[:success] = "Witamy w Karcie Oceny Ryzyka Rejestracji Podmiotów"
#      redirect_to @user
#    else
#      render 'new'
#    end
#  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Dodano użytkownika "+@user.forename+" "+@user.name+"w Karcie Oceny Ryzyka Rejestracji Podmiotów"
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Użytkownik skasowany."
    redirect_to users_url
  end
  
  def edit
 #   @user = User.find(params[:id])
  end
  
  
   def update
 #   @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Zmiany zapisane"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  
  
  
  
  private



    def user_params
      params.require(:user).permit(:login, :forename, :name, :email, :password,
                                   :password_confirmation)
    end
    
    def admin_user 
      unless current_user.admin?
        flash.now[:notice] = "Brak uprawnień"
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
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

  
end
