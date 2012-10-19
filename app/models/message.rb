class Message < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :message_template
   attr_accessible :user_id,:message_template_id,:response,:created_at,:updated_at
    #validates_presence_of :response
   
end
