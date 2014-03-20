class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid, null: false, index: { unique: true }
      t.string :username, null: false
      t.string :token, null: false
      t.string :secret, null: false
      t.timestamps
    end
  end
end
