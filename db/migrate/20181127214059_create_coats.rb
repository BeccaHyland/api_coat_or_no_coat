class CreateCoats < ActiveRecord::Migration[5.2]
  def change
    create_table :coats do |t|
      t.string :title
      t.float :high_temp
      t.float :low_temp
      t.string :precip_condition

      t.timestamps
    end
  end
end
