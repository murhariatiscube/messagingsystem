class CreateMessageTemplates < ActiveRecord::Migration
  def change
    create_table :message_templates do |t|
    t.string "name",:limit=>25
    t.text "data"
    t.date "active_form"
    t.date "active_until"
    t.boolean "status",:limit=>60
    t.timestamps
    end
  end
end
