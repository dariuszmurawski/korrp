class QuestionsController < ApplicationController
    before_action :signed_in_user, only: [:destroy, :index, :create, :new, :edit, :update]
    before_action :admin_user,     only: [:destroy, :index, :create, :new, :edit, :update]

  
  def index
    @questions = Question.paginate(page: params[:page])
  end
  
  def new
    @question = Question.new
  end
  
  def edit
    @question = Question.find(params[:id])  
  end
  
    
  def update  
    @question = Question.find(params[:id])  
     if @question.update_attributes(question_params)
          flash[:success] = "Zmiany zapisane"
          redirect_to questions_path
     else
          render 'edit'
     end
  end
  
  
  
  
  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Dodano nowe kryterium"
      redirect_to questions_path
    else
      render 'new'
    end
  end
  
  
  
   private

    def question_params
      params.require(:question).permit( :description, :strength)
    end
  
end