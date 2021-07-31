class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.references :courier, foreign_key: true
      t.column :tracking_number, :string
      t.column :delivery_status, :boolean
      t.column :courier_id, :integer

      t.timestamps
    end
  end
end
