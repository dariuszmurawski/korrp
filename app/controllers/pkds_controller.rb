class PkdsController < ApplicationController
 
  def index
    @search = Pkd.ransack(params[:q])
    @pkds = @search.result.paginate(page: params[:page],  :per_page => 15)
  end
  
  def autocomplete
    @pkds2 = Pkd.order(:description).where("description like ?", "%#{params[:term]}%")
    if @pkds2.length>1 
      render json: @pkds2.map(&:description)
    end
    
  end
  
  
  def get_branch
    if @branch = Pkd.find_by(description: params[:description])  
      render json: @branch
    end
    
  end
  
end

