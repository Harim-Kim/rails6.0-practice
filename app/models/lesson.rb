class Lesson < ApplicationRecord
  belongs_to :tutor
  belongs_to :time_table
  # belongs_to :student
end
