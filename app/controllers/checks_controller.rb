class ChecksController < ApplicationController
  before_action :signed_in_user, only: [:destroy, :index, :create, :new, :show]
  before_action :admin_user,     only: [:destroy]
#  include ChecksHelper

  
  def new
    @check = Check.new(userlogin: @current_user.name+' '+@current_user.forename)
    get_questions(@check)     
  end
 
 
 def get_questions(check) 
      @questions=Question.all      
      @questions.each do |question|
        check.answers.build(q_description: question.description,q_strength: question.strength)       
      end
 end 


 def show
    @check = Check.find(params[:id])
    @answers = @check.answers
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CheckPdf.new(@check)
        send_data pdf.render, filename: "Analiza_#{@check.nip}.pdf",
                                type: "application/pdf",
                                disposition: "inline"
      end
    end
 end
  
 
 def index
   
    @search = Check.ransack(params[:q])
    @checks = @search.result.paginate(page: params[:page],  :per_page => 15)

 end
 
 
 def create
  #TESTOWO
    @check = Check.new(check_params)
    if @check.save
      flash[:success] = "Dodano nową analizę"
      redirect_to checks_path
    else
      render action: 'new'
    end
 end
  
 def destroy
    Check.find(params[:id]).destroy
    flash[:success] = "Analiza skasowana."
    redirect_to checks_path
  end
   
  
  
  
  
   private

    def check_params
      params.require(:check).permit( :nip, :pesel, :regon, :forename, :name, :org_name, :city, :postal_code, :street, :home_no, :flat_no, :pkdfull, :branch, :score ,:level, :userlogin, answers_attributes: [:q_description, :q_strength, :q_answer])
    end
  
end