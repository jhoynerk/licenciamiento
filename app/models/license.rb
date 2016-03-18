class License < ActiveRecord::Base
  belongs_to :type_license
  has_one :contract
  has_many :suits
end
