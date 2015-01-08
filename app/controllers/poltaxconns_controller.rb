class PoltaxconnsController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show, :test]
  before_action :admin_user,     only: [:edit, :update, :show, :test]
  require 'connbuffer'

  
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
  rescue ActiveRecord::StaleObjectError
      @poltaxconn_tmp=Poltaxconn.find(params[:id])
      @poltaxconn.lock_version = @poltaxconn.lock_version_was
      @poltaxconn.errors.add :base, "w trakcie edycji rekord został zmodyfikowany przez innego użytkownika"
      @poltaxconn.changes.except("updated_at","lock_version").each do |par_name, values|
        @poltaxconn.errors.add par_name, "aktualnie ma wartość: #{values.first} próba modyfikacji na #{@poltaxconn[par_name]} "
        @poltaxconn[par_name]=@poltaxconn_tmp[par_name] 
      end
      render 'edit'   
  end
  
  def test
    @poltaxconn = Poltaxconn.first
    sql = "SELECT * from dual"
    result=Connbuffer.getdata(sql,@poltaxconn)
   

    if result !=nil
      if result[0]["dummy"]=="X"
        flash[:success] = "Udało się połączyć z bazą POLTAX"
        redirect_to @poltaxconn
      else
        flash[:error] = "Błąd połaczenia z bazą POLTAX"
        redirect_to @poltaxconn
      end
    else
      flash[:error] = "Błąd połaczenia z bazą POLTAX"
      redirect_to @poltaxconn
    end
   
  end
  
  
  
  
  
    private

    def poltaxconn_params
      params.require(:poltaxconn).permit( :database, :username, :password, :lock_version)
    end
  

  
end