class QuestionsController < ApplicationController
    before_action :signed_in_user, only: [:destroy, :index, :create, :new, :edit, :update]
    before_action :admin_kiera_user,     only: [:destroy, :index, :create, :new, :edit, :update]

  
  def index
    @questions = Question.paginate(page: params[:page])
  end
  
  def new
    @question = Question.new
  end
  
  def edit
    @question = Question.find(params[:id])  
  end
  
  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "Kryterium skasowane."
    redirect_to questions_url
  end
    
  def update  
    @question = Question.find(params[:id])  
     if @question.update_attributes(question_params)
          flash[:success] = "Zmiany zapisane"
          redirect_to questions_path
     else
          render 'edit'
     end
  rescue ActiveRecord::StaleObjectError
      @question_tmp=Question.find(params[:id])
      @question.lock_version = @question.lock_version_was
      @question.errors.add :base, "w trakcie edycji rekord został zmodyfikowany przez innego użytkownika"
      @question.changes.except("updated_at","lock_version").each do |par_name, values|
        @question.errors.add par_name, "aktualnie ma wartość: #{values.first} próba modyfikacji na #{@question[par_name]} "
        @question[par_name]=@question_tmp[par_name] 
      end
      render 'edit'   
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
      params.require(:question).permit( :description, :strength, :lock_version)
    end
  
end