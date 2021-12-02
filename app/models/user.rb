class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




  validates :name, presence: true
  has_many :orders
  has_many :restaurants
  has_many :reviews
  enum user_role: {customer: "customer", manager: "manager"}
  scope :customer, -> { where(role: 'customer') } #not understood
  scope :manager, -> { where(role: 'manager') }   
end
