class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  enum role: [:normal, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :normal
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :name, :college, :contact

  validates :username, presence: true
  validates :username, uniqueness: true, if: -> { self.username.present? }
  validates :name, presence: true
  validates :college, presence: true
  validates :contact, presence: true
end
