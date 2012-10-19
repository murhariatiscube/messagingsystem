class User < ActiveRecord::Base
	
   
     has_many :messages
    validates_presence_of :name, :email, :status,:password
	validates_uniqueness_of :name
	validates_length_of :name, :within => 3..25
	validates_length_of :password, :minimum => 8
	validates_length_of :nickname, :within => 2..25
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	
	
	attr_accessor :password
   attr_accessible :name,:nickname,:email,:password,:external_ref,:status,:created_at,:updated_at,:hashed_password
   attr_protected :hashed_password
	
  
   before_create :before_create
   before_update :before_update
   after_save :after_save
   before_destroy :before_destroy
   
 

  def before_create
  	
	  self.salt = User.make_salt(self.name)
      self.hashed_password = User.hash_with_salt(@password, self.salt)
  end
  
  def before_update
	  if !@password.blank?
	  	 self.salt = User.make_salt(self.name) if self.salt.blank?
         self.hashed_password = User.hash_with_salt(@password, self.salt)
      end
  end
  
  def after_save
    @password = nil
  end
  
  def before_destroy
    return false if self.id == 1
  end
  
  	
  def self.authenticate(name = "", password = "")
    user = self.find(:first, :conditions => ["name = ?", name])
    return (user && user.authenticated?(password)) ? user : nil
  end
  
  def authenticated?( password = "" )
    self.hashed_password == User.hash_with_salt(password, self.salt)
  end
  
  
    
  private 
  
  def self.make_salt( string )
	  return Digest::SHA1.hexdigest(string.to_s + Time.now.to_s)
  end
	
  def self.hash_with_salt(password, salt)
    return Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end
  

end
