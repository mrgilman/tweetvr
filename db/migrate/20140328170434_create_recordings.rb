class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.references :user
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end
  end
end
