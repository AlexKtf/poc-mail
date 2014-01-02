class ChangeReceiveridToRoomidFromMessage < ActiveRecord::Migration
  def change
    rename_column :messages, :receiver_id, :room_id
    rename_column :messages, :sender_id, :user_id
  end
end
