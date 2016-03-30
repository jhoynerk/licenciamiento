class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :suits

  scope :on, -> { where(status: true) }
end
