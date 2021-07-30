class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.column :tracking_number, :string, :limit => 32, :null => false
      t.column :delivery_status, :boolean
      t.column :courier_id, :integer
      t.references :courier, foreign_key: true

      t.timestamps
    end
  end
end
