class ChecksController < ApplicationController
  include ChecksHelper
  
  def new
    @check = Check.new
    get_questions(@check)
    
   # 3.times { @check.answers.build}
  end
  
  def create
    @check = Check.new(check_params)
    if @check.save
      flash[:success] = "Dodano nową analizę"
      redirect_to questions_path
    else
      render 'new'
    end
  end
  
  
   private

    def check_params
      params.require(:check).permit( :nip, :pesel, :regon, :forename, :name, :org_name, :city, :postal_code, :street, :home_no, :flat_no, :pkd_full, :branch)
    end
  
end