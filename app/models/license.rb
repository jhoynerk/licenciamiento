class License < ActiveRecord::Base
  belongs_to :type_license
  belongs_to :user
  has_many :computers_licenses, dependent: :destroy
  has_one :suit, dependent: :destroy
  has_one :contract
  accepts_nested_attributes_for :contract
  accepts_nested_attributes_for :suit

  validates :serial, uniqueness: true
  validates :serial, :creation_date, :type_license_id, :number_computers, presence: true

end
