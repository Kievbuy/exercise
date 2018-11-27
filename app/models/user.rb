class User < ApplicationRecord
  has_secure_password

  has_many :assignments
  has_many :roles, through: :assignments
  has_many :articles

  validates :email, :name, presence: true
  validates :email, uniqueness: true

  scope :admin, -> { joins(:roles).where("roles.name = 'admin'") }
  scope :reader, -> { joins(:roles).where("roles.name = 'reader'") }
  scope :writer, -> { joins(:roles).where("roles.name = 'writer'") }

  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end
end
