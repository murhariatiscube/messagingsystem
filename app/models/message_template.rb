class MessageTemplate < ActiveRecord::Base
	has_many :messages
  attr_accessible :name, :data, :active_form, :active_until, :status,:created_at,:updated_at
  
    validates_presence_of :name, :data,:status
	validates_uniqueness_of :name
	validates_length_of :name, :within => 3..25
end
