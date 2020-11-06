class Task < ApplicationRecord
  validates_presence_of :title

  scope :by_active, ->(value) { where(active: JSON.parse(value)) unless value.nil? }
  scope :search, ->(value) { where('title ILIKE :query OR description ILIKE :query', query: "%#{value.downcase}%") unless value.blank? }
end
