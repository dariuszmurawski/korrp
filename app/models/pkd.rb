class Pkd < ActiveRecord::Base
  has_many :checks
  default_scope -> { order('pkd_id') }
end
