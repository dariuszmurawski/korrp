class Check < ActiveRecord::Base
  has_many :answers, :dependent => :destroy
 # belongs_to :pkd
  accepts_nested_attributes_for :answers

  validates :forename, presence: true, length: { maximum: 15 }
  validates :name, presence: true, length: { maximum: 30 }
  validates :org_name, presence: true,length: { maximum: 50 }
  validates :city, presence: true 
  validates :postal_code, presence: true, format: { with: /^[\d][\d]-[\d][\d][\d]$/i ,:multiline => true}
#  validates :street, presence: true
  validates :home_no, presence: true, length: { maximum: 10 }
 # validates :flat_no, presence: true, length: { maximum: 50 }
  validates :pesel, presence: true, format: { with: /^[\d]{11}$/i,:multiline => true },length: {minimum: 11,maximum: 11}
  validates :regon, presence: true, format: { with: /^[\d]{9}$/i ,:multiline => true},length: {minimum: 9,maximum: 9}
  validates :nip, presence: true, format: { with: /^[\d]{10}$/i ,:multiline => true},length: {minimum: 10,maximum: 10}
  validates :pkdfull, presence: true
  validates :branch, presence: true, exclusion: {in: proc { |record| ['Zły kod PKD!'] } }
  validates :level, presence: true, length: { maximum: 6 }
  validates :userlogin, presence: true
#  validates :cancelled, presence: true
  validates :score, presence: true
  validates :level, presence: true
  
  default_scope -> { order('created_at') }
  
  
  def self.to_csv(options ={})
    CSV.generate(options) do |csv|
      @headers=["Imię i Nazwisko","Nazwa orgenizacji","Adres", "PESEL", "REGON", "NIP", "Kod PKD", "Branża",  "Ryzyko", "Pkt. ryzyka"]
      csv << @headers
      all.each do |check|
        if check.flat_no !=  ""
           @subject_data=[check.name+" "+check.forename, check.org_name, check.postal_code+" "+check.city+" "+check.street+" "+check.home_no+" m. "+check.flat_no, check.pesel, check.regon, check.nip, 
              check.pkdfull, check.branch,check.level, check.score]
        else
           @subject_data=[check.name+" "+check.forename, check.org_name, check.postal_code+" "+check.city+" "+check.street+" "+check.home_no, check.pesel, check.regon, check.nip, 
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
