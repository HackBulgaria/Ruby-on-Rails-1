class Brand < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
end