class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :index, :destroy, :create, :new]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy, :index, :create, :new]
  
  
  def new
    @user = User.new
  end
  
  def show
    store_location
    @user = User.find(params[:id])
  end
  
  def index
    store_location
    @users = User.paginate(page: params[:page])
  end
 

  def setpath 
    redirect_back_or @user
  end
  
  
  
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
    
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if current_user.admin?
        if @user.update_attributes(edit_user_params_no_login_with_admin)
          flash[:success] = "Zmiany zapisane"
          redirect_back_or @user
         # redirect_to users_path
        else
          render 'edit'
        end
    else
        if @user.update_attributes(edit_user_params_no_login)
          flash[:success] = "Zmiany zapisane"
          redirect_back_or @user
         # redirect_to @user
        else
          render 'edit'
        end
    end
  rescue ActiveRecord::StaleObjectError
      @user_tmp=User.find(params[:id])
      @user.lock_version = @user.lock_version_was
      @user.errors.add :base, "w trakcie edycji rekord został zmodyfikowany przez innego użytkownika"
      @user.changes.except("updated_at","lock_version").each do |par_name, values|
        @user.errors.add par_name, "aktualnie ma wartość: #{values.first} próba modyfikacji na #{@user[par_name]} "
        @user[par_name]=@user_tmp[par_name] 
      end
      render 'edit'   
  end
  
  
  
  private



    def user_params
      params.require(:user).permit(:admin, :kiera, :login, :forename, :name, :email, :password,
                                   :password_confirmation)
    end
    
    def edit_user_params_no_login
      params.require(:user).permit(:forename, :name, :email, :password,
                                   :password_confirmation, :lock_version)
    end
    
    def edit_user_params_no_login_with_admin
      params.require(:user).permit(:admin,:kiera,:forename, :name, :email, :password,
                                   :password_confirmation, :lock_version)
    end
   
  
    def correct_user
      @user = User.find(params[:id])
      if (!current_user.admin)
        unless current_user?(@user)
          flash.now[:notice] = "Brak uprawnień"
          redirect_to(root_url) 
        end
      end
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "W trakcie twojej edycji rekord został usunięty przez innego użytkownika"
      redirect_to users_path
    end

  
end
