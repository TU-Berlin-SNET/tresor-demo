class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :service_id
      t.float :costs

      t.timestamps
    end
  end
end
