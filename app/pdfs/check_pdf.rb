class CheckPdf < Prawn::Document
  
  def initialize(check)
    super(top_margin: 20,bottom_margin: 10,page_size: 'A4',layout: 'portrait')
    @check=check

    font_families.update("dejavu"=>{:normal =>"app/assets/fonts/DejaVuSans.ttf"})
    font "dejavu"
    font_size 8

    bounding_box [bounds.left, bounds.top], width: bounds.width, height: bounds.height - 15 do
  
 #   text "Analiza ryzyka rejestracji podmiotu"

      check_subject   
      check_answers 
      if cursor<150 
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
    font_size 16
    text "Analiza ryzyka rejestracji podmiotu"
    font_size 8
    move_down 10
    data = [ [ {content: "Dane podatnika", colspan: 2 } ],
            ["Imię i nazwisko:", @check.forename+" "+@check.name] , 
            ["Nazwa:", @check.org_name],
            ["Adres:", @check.postal_code+' '+@check.city+' '+@check.street+' '+@check.home_no+' '+@check.flat_no],
            ["NIP:",@check.nip],
            ["PESEL:",@check.pesel],
            ["REGON:",@check.regon],
            ["Kod i opis PKD:",@check.pkdfull],
            ["Branża:",@check.branch]
          ]
    table data,  column_widths: [100, 260] do
      cells.row(0).background_color = "dddddd"
      cells.column(0).background_color = "dddddd"
    end
  end
  
  def check_answers
    move_down 10
    
    answers_rows=[["Nazwa kryterium","Siła kryterium","TAK/NIE"]] +
      @check.answers.map do |ans|
        [ans.q_description.to_s, ans.q_strength.to_s, map_bool(ans)]
      end
    table answers_rows,header: true, column_widths: [420, 50, 45] do
      cells.row(0).background_color = "dddddd"
    end
  end
  
  
  
  
  def check_summary
    move_down 10
    
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
      bounding_box [bounds.left, bounds.bottom + 50], :width  => bounds.width do
        image "#{Rails.root}/app/assets/images/APlogo2.png", :width => 35
        stroke_horizontal_rule
        move_down(5)
        bounding_box [bounds.left, cursor], :width  => bounds.width-130 do
          text "Urząd Skarbowy w ..... | tel.: ...... | fax: .......", :size => 6
          text "e-mail ..... | NIP: ...... | REGON .......", :size => 6
        end
        move_up(10)
        bounding_box [bounds.right-100, cursor], :width  => 120 do
          text "www............", :size => 6
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

