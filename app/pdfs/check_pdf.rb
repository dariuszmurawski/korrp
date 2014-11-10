class CheckPdf < Prawn::Document
  
  def initialize(check, parameter)
    super(top_margin: 10,bottom_margin: 10,page_size: 'A4',layout: 'portrait')
    @check=check
    @parameter=parameter

    font_families.update("dejavu"=>{:normal =>"app/assets/fonts/DejaVuSans.ttf"})
    font "dejavu"
    font_size 8

    bounding_box [bounds.left, bounds.top], width: bounds.width, height: bounds.height - 15 do
  


      check_subject   
      check_answers 
      if cursor<130 
        start_new_page
        check_summary
        check_accept
      else
        check_summary
        check_accept
      end
      header_footer  
              
    end
  end
  
  
  def check_subject
    move_up 5
 #   draw_text @parameter.us_city+",............................", :at => [bounds.right-400,cursor-15],:align => :right
    bounding_box [[bounds.right-400,cursor-15]], :width  => 400 do
      text @parameter.us_city+",............................", :align => :right
    end
    move_up 20
    image "#{Rails.root}/app/assets/images/APlogo2.png", :width => 35

    font_size 6
    draw_text "Administracja", :at => [bounds.left+5,cursor]
    move_down 5
    draw_text "Podatkowa", :at => [bounds.left+5,cursor]
    font_size 8
    move_down 8
    text @parameter.us_name

    font_size 14
    text "Analiza ryzyka rejestracji podmiotu", :align => :center
    font_size 8
    move_down 5
    if @check.flat_no!=""
      data = [ [ {content: "Dane podatnika", colspan: 2 } ],
            ["Imię i nazwisko:", @check.forename+" "+@check.name] , 
            ["Nazwa:", @check.org_name],
            ["Adres:", @check.postal_code+' '+@check.city+' '+@check.street+' '+@check.home_no+' m. '+@check.flat_no],
            ["NIP:",@check.nip],
            ["PESEL:",@check.pesel],
            ["REGON:",@check.regon],
            ["Kod i opis PKD:",@check.pkdfull],
            ["Branża:",@check.branch]
          ]
    else
      data = [ [ {content: "Dane podatnika", colspan: 2 } ],
            ["Imię i nazwisko:", @check.forename+" "+@check.name] , 
            ["Nazwa:", @check.org_name],
            ["Adres:", @check.postal_code+' '+@check.city+' '+@check.street+' '+@check.home_no],
            ["NIP:",@check.nip],
            ["PESEL:",@check.pesel],
            ["REGON:",@check.regon],
            ["Kod i opis PKD:",@check.pkdfull],
            ["Branża:",@check.branch]
          ]
    end      
    table data,  column_widths: [100, 260] do
      cells.row(0).background_color = "dddddd"
      cells.column(0).background_color = "dddddd"
    end
  end
  
  def check_answers
    move_down 5
    
    answers_rows=[["Nazwa kryterium","Siła kryterium","TAK/NIE"]] +
      @check.answers.map do |ans|
        [ans.q_description.to_s, ans.q_strength.to_s, map_bool(ans)]
      end
    table answers_rows,header: true, column_widths: [420, 50, 45] do
      cells.row(0).background_color = "dddddd"
    end
  end
  
  
  
  
  def check_summary
    move_down 5
    
    data = [ [ {content: "Podsumowanie:", colspan: 4} ],
            ["Suma punktów: ", @check.score, "Wykonano przez:", @check.userlogin] , 
            ["Poziom ryzyka:", @check.level,"Wykonano dnia:", @check.created_at.strftime('%F %H:%M') ]
         ]
    table data,  column_widths: [80, 50,80,150] do
      cells.row(0).background_color = "dddddd"
    end
  end
  
  
  
  def map_bool(bool)
    if bool.q_answer 
      return "TAK" 
    else 
      return "NIE" 
    end
  end
  
  def header_footer
    repeat :all do
    # footer
      bounding_box [bounds.left, bounds.bottom + 15], :width  => bounds.width do
 #       image "#{Rails.root}/app/assets/images/APlogo2.png", :width => 35
        stroke_horizontal_rule
        move_down(5)
        bounding_box [bounds.left, cursor], :width  => bounds.width-130 do
          text "ul. "+@parameter.us_street+" "+@parameter.us_house+", "+@parameter.us_postalcode+" "+@parameter.us_city+" | tel.: "+@parameter.us_tel+" | fax: "+@parameter.us_fax, :size => 6
          text "e-mail:"+@parameter.us_email+" | NIP: "+@parameter.us_nip+" | REGON: "+@parameter.us_regon, :size => 6
        end
        move_up(10)
        bounding_box [bounds.right-120, cursor], :width  => 120 do
          text @parameter.us_www, :size => 6, :align => :right
        end
      end
    end
  end
  
  def check_accept
    move_down 40
    bounding_box([bounds.left+300,cursor], :width => 200) do
      text "...................................................." + "\n" +  "(data i podpis)", :align => :center
    end
    
  end
  
  
end

