class ChangeColumnNullToProfile < ActiveRecord::Migration[6.1]
  def change
    change_column_null :profiles, :birthday, true
    change_column_null :profiles, :country, true
    change_column_null :profiles, :city, true
  end
end
