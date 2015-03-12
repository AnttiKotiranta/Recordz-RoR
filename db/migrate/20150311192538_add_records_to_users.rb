class AddRecordsToUsers < ActiveRecord::Migration
  def change
	create_table :records_users, id: false do |t|
	t.belongs_to :record, index: true
        t.belongs_to :user, index: true
	end
  end
end
