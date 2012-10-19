class UsersController < ApplicationController

	def list
		@users=User.all
	end
	
	
  def login
  end
  
  def send_login
   
        found_user = User.authenticate(params[:name], params[:password])
       	if found_user
      	session[:user_id] = found_user.id
        flash[:notice] = "You are now logged in"
        render('menu')
      	else
      	  flash[:notice] = "plz check username or password"	
      	  redirect_to(:action => 'login')

  	    end	
    end
    
    def show
		@user = User.find(params[:id])
	end	


  def logout
  	session[:user_id] = nil
  	flash[:notice] = "You are logged out"
  	redirect_to(:controller => 'users',:action => 'login')
  end

	
	def new
		@user=User.new
	end
	
	def create
		
		@user = User.new(params[:user])
    if (@user.password === @user.confirmed_password && @user.save)        
      flash[:notice] = 'User was successfully created.'
      render('login')
     else 
	    flash[:notice] = 'User cheack password and confirmed_password.'
         render :action => 'new'
     end
		
	end	
		
	def edit
		@user=User.find(params[:id])
	end
	
	def update
		@user=User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:notice]="user updated"
			redirect_to(:action=>'list', :id=>@user.id)
		else
			render('edit')
		end	
	end
	
	def delete
		#@user=User.find(params[:id])
		User.find(params[:id]).delete
        redirect_to :action => 'list'
		flash[:notice] = 'User was successfully Deleted.'
		
	end
	
	#def destroy
	#	User.find(params[:id]).destroy
	#	flash[:notice]="user deleted"
	#	redirect_to(:action =>'list')
	#end								
	
	
	
end
