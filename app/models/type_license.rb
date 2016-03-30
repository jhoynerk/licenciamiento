class TypeLicense < ActiveRecord::Base
  scope :on, -> { where(status: true) }
end
