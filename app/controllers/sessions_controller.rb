class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(login: params[:session][:login].upcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Niepoprawny login lub hasło' 
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
end
