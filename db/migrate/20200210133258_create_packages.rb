class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :destination
      t.decimal :price
      t.text :details

      t.timestamps
    end
  end
end
