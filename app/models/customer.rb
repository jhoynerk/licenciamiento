class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :suits

  validates :rif, format: { with: /([V|E|G|J|P|N]{1}-\d{7,10})*/i , message: "El RIF o Cédula es inválido: Por favor ingresa uno válido. Formato: V-XXXXXXX" }
  validates :rif, :email, uniqueness: true

  scope :on, -> { where(status: true) }
end
