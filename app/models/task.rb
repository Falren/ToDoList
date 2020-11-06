class Task < ApplicationRecord
  validates_presence_of :title

  scope :by_active, ->(value) { where(active: JSON.parse(value)) unless value.nil? }
  scope :search, ->(value) { where('title ILIKE :params OR description ILIKE :params', params: "%#{value.downcase}%") unless value.blank? }
end
