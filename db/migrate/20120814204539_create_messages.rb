class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user
      t.references :message_template
      t.integer "response"
      t.timestamps
    end
    add_index :messages ,['user_id','message_template_id']
  end
end
