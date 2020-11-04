class Task < ApplicationRecord
  validates_presence_of :title

  scope :by_active, ->(value) { where(active: JSON.parse(value)) unless value.nil? }
end
