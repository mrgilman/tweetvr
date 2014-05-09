class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :recording
      t.string :text
      t.string :username
      t.datetime :created_at
    end
  end
end
