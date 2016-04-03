class Contract < ActiveRecord::Base
  has_enumeration_for :status, with: LicensesStatus, create_scopes: true, create_helpers: true

  scope :accepted, -> { where(status: LicensesStatus::NEVER_USED) }
  scope :pending, -> { where(status: LicensesStatus::USED) }

  validates :contract, uniqueness: true 
  validates :contract, presence: true 
end
