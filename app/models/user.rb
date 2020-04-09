class User < ApplicationModel
  include Users::Roles

  has_paper_trail

  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
    :validatable

  # Default order
  default_scope { order("#{table_name}.lastname ASC") }

  # Validations
  validates :name, presence: true
  validates :name, :lastname, length: { maximum: 255 }, allow_nil: true,
    allow_blank: true
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i },
    allow_nil: true, allow_blank: true, uniqueness: { case_sensitive: false }

  def to_s
    [self.name, self.lastname].compact.join(' ')
  end
end
