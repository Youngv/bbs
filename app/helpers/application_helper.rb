module ApplicationHelper	
	def markdown(text)
	    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(
	        :hard_wrap => true, :filter_html => true, :safe_links_only => true),
	        :no_intraemphasis => true, :autolink => true)
	    return markdown.render(text).html_safe
	end

	def active_tag(name)
		result = controller.controller_name == name ? 'active' : nil			
	end		
end
