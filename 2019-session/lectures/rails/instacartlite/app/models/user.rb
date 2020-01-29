class User < ApplicationRecord
  before_validation :normalize_name, on: :create

  validates :first_name, :email, :password, presence: true

  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_many :orders

  scope :no_last_name,   -> { where(last_name: nil) }
  scope :created_before, -> (time) { where("created_at < ?", time) }

  def public_normalize_name
    normalize_name
  end

  private

  def normalize_name
    self.first_name = first_name.capitalize
  end
end
