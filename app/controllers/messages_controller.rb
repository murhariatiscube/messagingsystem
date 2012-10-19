class MessagesController < ApplicationController
	before_filter :authorize_access
	def list
		@messages=Message.all
		@user=User.all
		@messagetemplate=MessageTemplate.all
	end
	
	def new
		@message=Message.new
		@user=User.order("name ASC")
		@messagetemplate=MessageTemplate.order("name ASC")
	end
	
	def create
		@message=Message.new(params[:message])
		if @message.save
			flash[:notice]="message created"
			redirect_to(:action=>'list')
		else
			render('new')
		end	
	end	
	
	def show
    @message = Message.find(params[:id])
  end
		
	def edit
		@message=Message.find(params[:id])
		@user=User.order("name ASC")
		@messagetemplate=MessageTemplate.order("name ASC")
	end
	
	def update
		@message=Message.find(params[:id])
		if @message.update_attributes(params[:message])
			flash[:notice]="message updated"
			redirect_to(:action=>'list', :id=>@message.id)
		else
			render('edit')
		end	
	end
	
	def delete
		#@message=Message.find(params[:id])
		Message.find(params[:id]).delete
        redirect_to :action => 'list'
		flash[:notice] = 'Message was successfully Deleted.'
	end
	
	#def destroy
		#Message.find(params[:id]).destroy
		#flash[:notice]="message deleted"
		#redirect_to(:action =>'list')
	#end								
end
