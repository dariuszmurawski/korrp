class PkdsController < ApplicationController
 
 
  def index
    
    @search = Pkd.ransack(params[:q])
    @pkds = @search.result.paginate(page: params[:page],  :per_page => 15)
    
  end
  
  
  
end

