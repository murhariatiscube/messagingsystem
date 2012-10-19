class MessageTemplatesController < ApplicationController
	before_filter :authorize_access
	def list
		@messagetemplates=MessageTemplate.all
	end
	
	def new
		@messagetemplate=MessageTemplate.new
	end
	
	def create
		@messagetemplate=MessageTemplate.new(params[:messagetemplate])
		if @messagetemplate.save
			flash[:notice]="messagetemplate created"
			redirect_to(:action=>'list')
		else
			render('new')
		end	
	end	
	
	
  def show
    @messagetemplate = MessageTemplate.find(params[:id])
  end
		
	def edit
		@messagetemplate=MessageTemplate.find(params[:id])
	end
	
	def update
		@messagetemplate=MessageTemplate.find(params[:id])
		if @messagetemplate.update_attributes(params[:messagetemplate])
			flash[:notice]="messagetemplate updated"
			redirect_to(:action=>'list', :id=>@messagetemplate.id)
		else
			render('edit')
		end	
	end
	
	def delete
		#@messagetemplate=MessageTemplate.find(params[:id])
		MessageTemplate.find(params[:id]).delete
        redirect_to :action => 'list'
		flash[:notice] = 'MessageTemplate was successfully Deleted.'
	end
	
	#def destroy
		#MessageTemplate.find(params[:id]).destroy
		#flash[:notice]="messagetemplate deleted"
		#redirect_to(:action =>'list')
	#end								
	
	
	
	
end
