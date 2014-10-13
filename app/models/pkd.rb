class Pkd < ActiveRecord::Base
  default_scope -> { order('pkd_id') }
end
