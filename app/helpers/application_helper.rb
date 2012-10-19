module ApplicationHelper
	def error_messages_for(object)
		render(:partial=>'p_temp/error_messages', :locals=> {:object =>object})
	end
	
end
