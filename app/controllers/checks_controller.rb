class ChecksController < ApplicationController
  before_action :signed_in_user, only: [:destroy, :index, :create, :new, :show]
  before_action :admin_user,     only: [:destroy]
#  include ChecksHelper

  
  def new
    @check = Check.new
    get_questions(@check)     
  #  respond_to do |format|
  #    format.html
  #    format.js 
  #  end
  end
 
 
 def get_questions(check) 
      @questions=Question.all      
      @questions.each do |question|
        check.answers.build(q_description: question.description,q_strength: question.strength)       
      end
 end 

 
# def get_pkd_branch
#   @pkd1=Pkd.find(params[:description])
#   respond_to do |format|
#      format.js
#   end
# end
 
 
 
 def create
  #TESTOWO
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