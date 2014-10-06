class LevelsController < ApplicationController
    before_action :signed_in_user, only: [ :index, :edit, :update]
    before_action :admin_user,     only: [ :index, :edit, :update]
  
  def index
    @levels=Level.all
  end
  
  def edit
    @level = Level.find(params[:id]) 
  end  
  
  def update
    @level = Level.find(params[:id])
    
    if @level.description == "WYSOKI"      
        @level2=Level.find_by(description: "NISKI")
        if @level2.value>params[:level][:value].to_i
            @level.errors.add(:value, "error1")
            render 'edit'
        else
            if @level.update_attributes(level_params)
               flash[:success] = "Zmiany zapisane"
               redirect_to levels_path
            else
               render 'edit'
            end      
        end    
    else
        @level2=Level.find_by(description: "WYSOKI")
        if @level2.value<params[:level][:value].to_i
            @level.errors.add(:value, "error2")
            render 'edit' 
        else
          if @level.update_attributes(level_params)
               flash[:success] = "Zmiany zapisane"
               redirect_to levels_path
          else
               render 'edit'
          end                    
        end      
    end
    
      
     
  end
  
  
   private

    def level_params
      params.require(:level).permit(:value)
    end
  
  
end