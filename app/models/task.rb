class Task < ApplicationRecord
  
  validates :title, presence: true

  scope :by_active, ->(value) { where(active: value.to_b) unless value.nil? }
  scope :search, ->(value) { where('title ILIKE :query OR description ILIKE :query', query: "%#{value.downcase}%") unless value.blank? }
end
