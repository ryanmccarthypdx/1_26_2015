class Division < ActiveRecord::Base
  has_many :employees, :dependent => :delete_all
end
