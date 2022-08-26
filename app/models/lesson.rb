class Lesson < ApplicationRecord
  belongs_to :tutor
  belongs_to :time_table
  has_and_belongs_to_many :users
end
