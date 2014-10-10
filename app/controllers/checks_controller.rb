class ChecksController < ApplicationController
  before_action :signed_in_user, only: [:destroy, :index, :create, :new, :show]
  before_action :admin_user,     only: [:destroy]
  include ChecksHelper

  
  def new
    @check = Check.new
    get_questions(@check)
    
    get_pkds
    
    respond_to do |format|
      format.html
      format.js 
    end
   # 3.times { @check.answers.build}
  end
 
 # def create
 #   @check = Check.new(check_params)
 #   if @check.save
 #     flash[:success] = "Dodano nową analizę"
 #     redirect_to questions_path
 #   else
 #     render 'new'
 #   end
 # end
  
  
  
  
  
  
   private

    def check_params
      params.require(:check).permit( :nip, :pesel, :regon, :forename, :name, :org_name, :city, :postal_code, :street, :home_no, :flat_no, :pkd_full, :branch)
    end
  
end