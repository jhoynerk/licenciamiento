class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :customers
  has_many :licenses

  validates :email, uniqueness: true
  validates :password, presence: true, on: :create
  validates :password, confirmation: true, on: :create


  def complete_name
    (last_name + ' ' + first_name).titleize
  end
end
