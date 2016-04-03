class ComputersLicense < ActiveRecord::Base
  belongs_to :license

  validates :ip, uniqueness: true
end
