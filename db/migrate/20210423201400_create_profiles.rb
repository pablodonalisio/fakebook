class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.date :birthday
      t.string :country
      t.string :city
      t.string :photo

      t.timestamps
    end
  end
end
