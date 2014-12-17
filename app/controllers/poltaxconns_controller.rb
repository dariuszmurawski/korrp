class PoltaxconnsController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show, :test]
  before_action :admin_user,     only: [:edit, :update, :show, :test]
  
  
  def show
     @poltaxconn = Poltaxconn.first
  end
  
  def edit
    @poltaxconn = Poltaxconn.first
  end
  
  def update
    @poltaxconn = Poltaxconn.first
     if @poltaxconn.update_attributes(poltaxconn_params)
          flash[:success] = "Zmiany zapisane"
          redirect_to @poltaxconn
     else
          render 'edit'
     end
  end
  
  def test
    @poltaxconn = Poltaxconn.first
 #   @connection=ActiveRecord::Base.establish_connection(adapter: "oracle_enhanced", database: "//10.2.21.210:1521/PLTX",username: "ops$rdonly", password: "andwgirlap")
 #   sql = "SELECT * from dual"
 #   @result = @connection.connection.select_all(sql)
    
    flash[:success] = "Udało się połączyć z bazą POLTAX"
    redirect_to @poltaxconn
    
#    if @result[0]["dummy"]=="X"
#      flash.now[:success] = "Udało się połączyć z bazą POLTAX"
#      render action: 'show'
#      #redirect_to @poltaxconn
#    else
#      flash.now[:error] = "Błąd połaczenia z bazą POLTAX"
#      render action: 'show'
#    end
   
  end
  
  
  
  
  
    private

    def poltaxconn_params
      params.require(:poltaxconn).permit( :database, :username, :password)
    end
  

  
end