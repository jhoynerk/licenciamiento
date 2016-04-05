class ComputersLicense < ActiveRecord::Base
  has_enumeration_for :status, with: ComputerStatus, create_scopes: true, create_helpers: true

  belongs_to :license

  validates :ip, uniqueness: true

  scope :active, -> { where(status: ComputerStatus::ON) }
  scope :desactive, -> { where(status: ComputerStatus::OFF) }
end
