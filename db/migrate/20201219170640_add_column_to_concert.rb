class AddColumnToConcert < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :date_concert, :date
    add_column :concerts, :duration, :integer
  end
end
