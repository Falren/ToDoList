
class String
  def to_b
    ActiveRecord::Type::Boolean.new.cast(self)
  end
end