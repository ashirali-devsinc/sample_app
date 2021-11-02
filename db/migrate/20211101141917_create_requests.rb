class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.integer :status

      t.timestamps
    end
    add_index :requests, :reciever_id
    add_index :requests, :sender_id
  end
end
