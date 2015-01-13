class ChecksController < ApplicationController
  before_action :signed_in_user,       only: [:destroy, :index, :create, :new, :show]
  before_action :admin_kiera_user,     only: [:destroy,:edit,:update, :reset]
  require 'connbuffer'
  require 'will_paginate/array'
#  include ChecksHelper

  
  def new
    if params[:check]!=nil
      @check = Check.new(check_search_params)
      @check.userlogin=@current_user.name+' '+@current_user.forename
    else
      @check = Check.new(userlogin: @current_user.name+' '+@current_user.forename)
    end
    get_questions(@check)     
  end
 
  def persearch  
#    session[:check] ||= params[:check]
    @poltaxconn = Poltaxconn.first
    sql = "SELECT * from dual"
    result=Connbuffer.getdata(sql,@poltaxconn)
    if result !=nil
      if result[0]["dummy"]!="X"
        flash[:error] = "Błąd połaczenia z bazą POLTAX"
        redirect_to new_check_path
      end
    else
      flash[:error] = "Błąd połaczenia z bazą POLTAX"
      redirect_to new_check_path
    end
  end
  
  def orgsearch
#    session[:check] ||= params[:check]
    @poltaxconn = Poltaxconn.first
    sql = "SELECT * from dual"
    result=Connbuffer.getdata(sql,@poltaxconn)
    if result !=nil
      if result[0]["dummy"]!="X"
        flash[:error] = "Błąd połaczenia z bazą POLTAX"
        redirect_to new_check_path
      end
    else
      flash[:error] = "Błąd połaczenia z bazą POLTAX"
      redirect_to new_check_path
    end
  end
  
  def searchresult
 
    if (params[:type]=="person")
      if (params[:nip]=='' && params[:pesel]=='' && params[:name]=='') 
        flash[:error] = "Przynajmniej jedno z pól: NIP, PESEL, Nazwisko musi być wypełnione"
        redirect_to persearch_path
      else
        @poltaxconn = Poltaxconn.first
        sql = "SELECT to_char(p.tin) nip, to_char(p.pesel_no) pesel, p.family_name name, p.forename_1 forename, p.city city, p.street street, p.house_no home_no, p.flat_no flat_no, p.postal_code postal_code from persons p where p.dereg_date is null"
          if params[:nip]!=''
            sql=sql+" and p.tin='"+params[:nip]+"'"
          end
          if params[:pesel]!=''
            sql=sql+" and p.pesel_no='"+params[:pesel]+"'"
          end
          if params[:name]!=''
            sql=sql+" and p.family_name='"+params[:name].mb_chars.upcase+"'"
          end
          if params[:forename]!=''
            sql=sql+" and p.forename_1='"+params[:forename].mb_chars.upcase+"'"
          end
        @sql=sql
        @results=Connbuffer.getdata(sql,@poltaxconn)
        if @results!=nil
          @results = @results.paginate(page: params[:page],  :per_page => 15)
        else
          flash[:error] = "Błąd połaczenia z bazą POLTAX"
          redirect_to persearch_path
        end  
      end 
    end
    
     if (params[:type]=="organ")
      if (params[:nip]=='' && params[:regon]=='' && params[:name]=='') 
        flash[:error] = "Przynajmniej jedno z pól: NIP, REGON, Nazwa organizacji musi być wypełnione"
        redirect_to orgsearch_path
      else
        @poltaxconn = Poltaxconn.first
        sql = "SELECT to_char(o.tin) nip, to_char(o.regon_no) regon, o.full_name org_name, o.city city, o.street street, o.house_no home_no, o.flat_no flat_no, o.postal_code postal_code from organs o where o.dereg_date is null"
          if params[:nip]!=''
            sql=sql+" and o.tin='"+params[:nip]+"'"
          end
          if params[:regon]!=''
            sql=sql+" and o.regon_no='"+params[:regon]+"'"
          end
          if params[:name]!=''
            sql=sql+" and o.full_name like '%"+params[:name].mb_chars.upcase+"%'"
          end
        @sql=sql
        @results=Connbuffer.getdata(sql,@poltaxconn)
        if @results!=nil
          @results = @results.paginate(page: params[:page],  :per_page => 15)
        else
          flash[:error] = "Błąd połaczenia z bazą POLTAX"
          redirect_to orgsearch_path
        end  
      end 
    end
    
  end
  
 
  def edit
    @check = Check.find(params[:id])     
  end
 
 def get_questions(check) 
      @questions=Question.all      
      @questions.each do |question|
        check.answers.build(q_description: question.description,q_strength: question.strength)       
      end
 end 


 def show
    @parameter = Parameter.first
    @check = Check.find(params[:id])
    @answers = @check.answers

    
    
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CheckPdf.new(@check,@parameter)
        if @check.nip!=nil
        send_data pdf.render, filename: "Analiza_NIP:#{@check.nip}_DATA:#{@check.created_at.strftime('%F')}.pdf",
                            #    disposition: "inline",
                                type: "application/pdf"
        else
        send_data pdf.render, filename: "Analiza_PESEL:#{@check.pesel}_DATA:#{@check.created_at.strftime('%F')}.pdf",
                            #    disposition: "inline",
                                type: "application/pdf"  
        end
                            
      end
    end
 end
  
 
 def index
   
    @search = Check.ransack(params[:q])
    @checksall = Check.all
    @checks = @search.result.paginate(page: params[:page],  :per_page => 15)
    respond_to do |format|
      format.html
      format.csv {send_data @checksall.to_csv(col_sep: "*", row_sep: "\r\n")}
      format.xls {}#{send_data @checksall.to_csv(col_sep: "\t", row_sep: "\r\n")}
    end
 end
 
  def reset
    @check = Check.find(params[:id]) 
    @check.answers.destroy_all 
    get_questions(@check)
        if @check.save
          @check.userloginedit=@current_user.name+' '+@current_user.forename
          flash.now[:success] = "Zresetowano kryteria analizy - pozostałe wprowadzone zmiany w formularzu zostały pominięte"
          render action: 'edit'
        else
         flash.now[:error] = 'Błąd podczas resetowania analizy' 
         render action: 'edit'
       end
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
  
  
 def update
    @check = Check.find(params[:id]) 
    if @check.update_attributes(check_params)
      @check.userloginedit=@current_user.name+' '+@current_user.forename
      flash[:success] = "Zmodyfikowano analizę"
      redirect_to check_path(@check)
    else
      render action: 'edit'
    end
    rescue ActiveRecord::StaleObjectError
      @check_tmp=Check.find(params[:id])
      @check.lock_version = @check.lock_version_was
      @check.errors.add :base, "w trakcie edycji rekord został zmodyfikowany przez innego użytkownika"
      @check.changes.except("updated_at","lock_version", "level", "score").each do |par_name, values|
        @check.errors.add par_name, "aktualnie ma wartość: #{values.first} próba modyfikacji na #{@check[par_name]} "
        @check[par_name]=@check_tmp[par_name] 
      end
      @check.answers.each do |answer|
       answer.changes.except("updated_at","lock_version").each do |par_name, values|
          answer.errors.add par_name, "bump"
          @check.errors.add par_name, "#{answer.q_description} aktualnie ma wartość: #{t(values.first.to_s)} próba modyfikacji na #{t(answer.q_answer.to_s)}"
       #   byebug
          answer[par_name]=values.first
       end
      end 
      
      render 'edit' 
 end
  
  

  
  
 def destroy
    Check.find(params[:id]).destroy
    flash[:success] = "Analiza skasowana."
    redirect_to checks_path
 end
   
  
  
  
  
   private

    def check_params
      params.require(:check).permit( :nip, :pesel, :regon, :forename, :name, :org_name, :city, :postal_code, :street, :home_no, :flat_no, :pkdfull, :branch, :score ,:level, :userlogin, :lock_version, answers_attributes: [:id, :q_description, :q_strength, :q_answer])
    end
    
    def check_search_params
      params.require(:check).permit( :nip, :pesel, :regon, :forename, :name, :org_name, :city, :postal_code, :street, :home_no, :flat_no)
    end
  
end