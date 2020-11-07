class Task < ApplicationRecord
  
  validates_presence_of :title

  scope :by_active, ->(value) { where(active: to_boolean(value)) unless value.nil? }
  scope :search, ->(value) { where('title ILIKE :query OR description ILIKE :query', query: "%#{value.downcase}%") unless value.blank? }

  private 

  def self.to_boolean(string)
    ActiveRecord::Type::Boolean.new.cast(string)
  end
end
