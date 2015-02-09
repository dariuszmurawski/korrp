class LevelsController < ApplicationController
    before_action :signed_in_user, only: [ :index, :edit, :update]
    before_action :admin_kiera_user,     only: [ :index, :edit, :update]
    require 'check'
    
    
  def index
    @levels=Level.all
  end
  
  def edit
    @level = Level.find(params[:id]) 
    @levels=Level.all 
  end  
  
  def update
    @level = Level.find(params[:id])
    
    if @level.description == "WYSOKI"      
        @level2=Level.find_by(description: "ŚREDNI")
        if @level2.value>params[:level][:value].to_i
       
            @level.errors.add(:value, "WYSOKI musi być większa niż przedziału NISKI")
            @levels=Level.all
            render 'edit'
        else
            if @level.update_attributes(level_params)
               flash[:success] = "Zmiany zapisane"
               @checks=Check.all
               value1=Level.find_by(description: "ŚREDNI").value
               value2=Level.find_by(description: "WYSOKI").value
               @checks.each do |check|
                  if check.score<value1
                    check.level="NISKI"
                  elsif check.score<value2
                    check.level="ŚREDNI"
                  else
                    check.level="WYSOKI"
                  end
                  check.save
               end
               redirect_to levels_path
            else
               @levels=Level.all
               render 'edit'
            end      
        end    
    else
        @level2=Level.find_by(description: "WYSOKI")
        if @level2.value<params[:level][:value].to_i
            @level.errors.add(:value, "NISKI musi być mniejsza niż przedziału WYSOKI")
            @levels=Level.all
            render 'edit' 
        else
          if @level.update_attributes(level_params)
               flash[:success] = "Zmiany zapisane"
               @checks=Check.all
               value1=Level.find_by(description: "ŚREDNI").value
               value2=Level.find_by(description: "WYSOKI").value
               @checks.each do |check|
                  if check.score<value1
                    check.level="NISKI"
                  elsif check.score<value2
                    check.level="ŚREDNI"
                  else
                    check.level="WYSOKI"
                  end
               end
               redirect_to levels_path
          else
              @levels=Level.all
               render 'edit'
          end                    
        end      
    end
  rescue ActiveRecord::StaleObjectError
      @level_tmp=Level.find(params[:id])
      @level.lock_version = @level.lock_version_was
      @level.errors.add :base, "w trakcie edycji rekord został zmodyfikowany przez innego użytkownika"
      @level.changes.except("updated_at","lock_version").each do |par_name, values|
        @level.errors.add par_name, "aktualnie ma wartość: #{values.first} próba modyfikacji na #{@level[par_name]} "
        @level[par_name]=@level_tmp[par_name] 
      end
      render 'edit' 
  end

      
  def get_levels
    @levels = Level.all
    render json: @levels
  end
     

  
  
   private

    def level_params
      params.require(:level).permit(:value, :lock_version)
    end
  
  
end