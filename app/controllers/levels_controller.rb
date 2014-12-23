class LevelsController < ApplicationController
    before_action :signed_in_user, only: [ :index, :edit, :update]
    before_action :admin_kiera_user,     only: [ :index, :edit, :update]
  
  def index
    @levels=Level.all
  end
  
  def edit
    @level = Level.find(params[:id]) 
  end  
  
  def update
    @level = Level.find(params[:id])
    
    if @level.description == "WYSOKI"      
        @level2=Level.find_by(description: "ŚREDNI")
        if @level2.value>params[:level][:value].to_i
            @level.errors.add(:value, "WYSOKI musi być większa niż przedziału NISKI")
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
            @level.errors.add(:value, "NISKI musi być mniejsza niż przedziału WYSOKI")
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

      
  def get_levels
    @levels = Level.all
    render json: @levels
  end
     

  
  
   private

    def level_params
      params.require(:level).permit(:value)
    end
  
  
end