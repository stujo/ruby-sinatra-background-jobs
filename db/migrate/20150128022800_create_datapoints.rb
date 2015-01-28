class CreateDatapoints < ActiveRecord::Migration
  def change
    create_table :datapoints do |t|
      t.string :datapoint
      t.references :location
      t.timestamps :null => false
    end
  end
end
