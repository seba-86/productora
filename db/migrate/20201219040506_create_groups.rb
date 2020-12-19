class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :integrantes
      t.date :date_start

      t.timestamps
    end
  end
end
