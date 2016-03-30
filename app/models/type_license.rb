class TypeLicense < ActiveRecord::Base
  has_many :license
  scope :on, -> { where(status: true) }
end
