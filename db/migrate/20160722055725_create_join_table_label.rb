class CreateJoinTableLabel < ActiveRecord::Migration[5.0]
  def change
    create_join_table :orders, :labels do |t|
      t.index [:order_id, :label_id]
      t.index [:label_id, :order_id]
    end
  end
end
