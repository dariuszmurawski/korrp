class Check < ActiveRecord::Base
  has_many :answers, :dependent => :destroy
 # belongs_to :pkd
  accepts_nested_attributes_for :answers

  validates :forename, presence: {message: "brak nazwy organizacji - Imię nie może być puste"},   unless:  :org_name? 
  validates :forename, length: { maximum: 15 } ,if: :forename?
  
  validates :name, presence: {message: "brak nazwy organizacji - Nazwisko nie może być puste"},   unless:  :org_name?
  validates :name, length: { maximum: 30 } , if: :name?
  
  validates :org_name, presence: {message: "brak imienia oraz nazwiska - nazwa organizacji nie może być pusta"},  unless:  (:name? && :forename?)
  validates :org_name,length: { maximum: 150 } ,if: :org_name?
  
  validates :city, presence: true
  validates :postal_code, presence: true, format: { with: /^[\d][\d]-[\d][\d][\d]$/i ,:multiline => true, message: "zły format pola - powinno być: XX-XXX"}
  validates :home_no, presence: true, length: { maximum: 10 } 
  
  validates :pesel, presence: {message: "wystepuje imię oraz nazwisko - pesel nie może być pusty"}, if:  (:name? && :forename?)
  validates :pesel, format: { with: /^[\d]{11}$/i,:multiline => true, message: "zły format pola - powinno być 11 cyfr" } ,if: :pesel?
  
  validates :regon, presence: {message: "wystepuje nazwa organizacji - regon nie może być pusty"}, if:  :org_name?
  validates :regon, format: { with: /^[\d]{7,14}$/i ,:multiline => true, message: "zły format pola - powinno być od 7 do 14 cyfr"}, if: :regon?
  
  validates :nip, presence: {message: "wystepuje nazwa organizacji - nip nie może być pusty"}, if:  :org_name? 
  validates :nip,  format: { with: /^[\d]{10}$/i ,:multiline => true, message: "zły format pola - powinno być 10 cyfr"}, if: :nip?
  
  validates :pkdfull, presence: true
  validates :branch, presence: true, exclusion: {in: proc { |record| ['Zły kod PKD!'] } }
  validates :level, presence: true, length: { maximum: 6 }
  validates :userlogin, presence: true
#  validates :cancelled, presence: true
#  validates :flat_no , format: { without: /\s/ }
#  validates :street, presence: true
  validates :score, presence: true
  validates :level, presence: true
  
  default_scope -> { order('created_at') }
  
#  def empty_person?
#    ((params[:name].nil? || params[:name]=='') && (params[:forename].nil? || params[:forename]==''))
#  end
  
#  def empty_organ?
#    :org_name==nil
#  end
  
  
  def self.to_csv(options ={})
    CSV.generate(options) do |csv|
      @headers=["Imię i Nazwisko","Nazwa organizacji","Adres", "PESEL", "REGON", "NIP", "Kod PKD", "Branża",  "Ryzyko", "Pkt. ryzyka"]
      csv << @headers
      all.each do |check|
        if check.flat_no.to_s !=  "" && check.flat_no!=nil
           @subject_data=[check.name.to_s+" "+check.forename.to_s, check.org_name.to_s, check.postal_code+" "+check.city+" "+check.street+" "+check.home_no+" m. "+check.flat_no, check.pesel, check.regon, check.nip, 
              check.pkdfull, check.branch,check.level, check.score]
        else
           @subject_data=[check.name.to_s+" "+check.forename.to_s, check.org_name.to_s, check.postal_code+" "+check.city+" "+check.street+" "+check.home_no, check.pesel, check.regon, check.nip, 
              check.pkdfull, check.branch,check.level, check.score]
        end
        @answers_data=["Odpowiedzi:"]
        check.answers.each do |answer|
          tmp=nil
          if answer.q_answer==true
            tmp="TAK"
          else
            tmp="NIE"
          end
          @answers_data=@answers_data+[answer.q_description,answer.q_strength,tmp]
        end
        csv << @subject_data+@answers_data
      end   
    end   
  end
  

  
end
