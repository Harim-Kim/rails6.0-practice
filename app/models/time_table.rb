class TimeTable < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_and_belongs_to_many :students
end
