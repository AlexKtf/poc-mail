class CreateRoomUserRelation < ActiveRecord::Migration
  def change
    create_table :room_users do |t|
      t.references :room, index: true
      t.references :user, index: true
    end
  end
end
