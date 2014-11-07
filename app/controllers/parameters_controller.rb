class ParametersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show]
  before_action :admin_user,     only: [:edit, :update,]
  
  
  def show
     @parameter = Parameter.first
  end
  
  def edit
    @parameter = Parameter.first
  end
  
  def update
    @parameter = Parameter.first
     if @parameter.update_attributes(parameter_params)
          flash[:success] = "Zmiany zapisane"
          redirect_to @parameter
     else
          render 'edit'
     end
  end
  
    private

    def parameter_params
      params.require(:parameter).permit( :us_code, :us_name, :us_street, :us_city, :us_house, :us_nip, :us_regon , :us_www, :us_tel, :us_fax, :us_postalcode, :us_email)
    end
  

  
end