class Workout < ActiveRecord::Base
  validates :time, :presence => true
  validates :date, :presence => true
  validates :type, :presence => true

  self.inheritance_column = nil
end
