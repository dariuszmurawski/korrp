class Check < ActiveRecord::Base
  has_many :answers, :dependent => :destroy
  belongs_to :pkd
  accepts_nested_attributes_for :answers

  validates :forename, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :org_name, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true, format: { with: /\A[\d][\d]-[\d][\d][\d]\z/i }
#  validates :street, presence: true
  validates :home_no, presence: true, length: { maximum: 50 }
 # validates :flat_no, presence: true, length: { maximum: 50 }
  validates :pesel, presence: true, format: { with: /\A[\d]{11}\z/i }
  validates :regon, presence: true, format: { with: /\A[\d]{9}\z/i }
  validates :nip, presence: true, format: { with: /\A[\d]{10}\z/i }
  validates :pkd_full, presence: true
  validates :branch, presence: true, exclusion: {in: proc { |record| ['Zły kod PKD!'] } }
  validates :level, presence: true, length: { maximum: 6 }
  validates :user_id, presence: true
#  validates :cancelled, presence: true
  validates :score, presence: true
  validates :level, presence: true
  
  default_scope -> { order('created_at') }
  
  
  
  def pkd_description
    pkd.try(:description)
  end
  
  def pkd_description=(description)
    self.pkd = Pkd.find_by_description(description) if description.present?
  end
  
  
  
  
end
