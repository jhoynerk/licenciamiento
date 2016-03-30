class Product < ActiveRecord::Base
  has_many :suits
  scope :on, -> { where(status: true) }
end
