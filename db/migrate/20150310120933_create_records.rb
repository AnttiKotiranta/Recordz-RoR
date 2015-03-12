class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name
      t.text :info
      t.integer :year
      t.integer :performer_id

      t.timestamps
    end
  end
end
