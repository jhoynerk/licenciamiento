class Suit < ActiveRecord::Base
  belongs_to :customer
  belongs_to :license
  belongs_to :product
end
