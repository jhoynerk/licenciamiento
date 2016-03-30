class Product < ActiveRecord::Base
  scope :on, -> { where(status: true) }
end
