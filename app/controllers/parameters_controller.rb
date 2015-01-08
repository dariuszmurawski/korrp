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
  rescue ActiveRecord::StaleObjectError
      @parameter_tmp=Parameter.find(params[:id])
      @parameter.lock_version = @parameter.lock_version_was
      @parameter.errors.add :base, "w trakcie edycji rekord został zmodyfikowany przez innego użytkownika"
      @parameter.changes.except("updated_at","lock_version").each do |par_name, values|
        @parameter.errors.add par_name, "aktualnie ma wartość: #{values.first} próba modyfikacji na #{@parameter[par_name]} "
        @parameter[par_name]=@parameter_tmp[par_name] 
      end
      render 'edit' 
  end
  
    private

    def parameter_params
      params.require(:parameter).permit( :us_code, :us_name, :us_street, :us_city, :us_house, :us_nip, :us_regon , :us_www, :us_tel, :us_fax, :us_postalcode, :us_email, :lock_version)
    end
  

  
end