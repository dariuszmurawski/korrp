class Answer < ActiveRecord::Base
  belongs_to :check
#  validates :check_id, presence: true

  default_scope -> { order('q_description') }
end
