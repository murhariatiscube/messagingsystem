class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string "name",:limit=>25
    t.string "nickname",:limit=>50
    t.string "email",:default=>"",:null=>false
    t.string "hashed_password", :limit=>50
    t.string "confirmed_password"		
    t.string "salt"  
    t.string "external_ref",:limit=>60
    t.boolean "status",:limit=>60
    t.timestamps
    end
  end
end
