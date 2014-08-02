class JosephMemo < ActiveRecord::Base
  validates :name, presence: true
  validates :title, presence: true
  validates :words, presence: true
end
