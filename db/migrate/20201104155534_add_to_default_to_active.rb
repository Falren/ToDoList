class AddToDefaultToActive < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:tasks, :active, true)
  end
end
