class Address < ApplicationRecord
  after_commit :set_active_address 
  belongs_to :user

  scope :active, -> { where active: true }

  def set_active_address
    user.addresses.each do |a|
      if a.id != id && active
        a.active = false
        a.save
      end
    end
  end
end
