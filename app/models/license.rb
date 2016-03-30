class License < ActiveRecord::Base
  belongs_to :type_license
  belongs_to :user
  has_one :suit, dependent: :destroy
  has_one :contract
  accepts_nested_attributes_for :contract
  accepts_nested_attributes_for :suit
end
