module ChecksHelper
  
  def get_questions(check) 
      @questions=Question.all      
      @questions.each do |question|
        check.answers.build(q_description: question.description,q_strength: question.strength)       
      end
   end 
  
  
  def get_pkds
      @pkds=Pkd.all
  end
  


  
  
end