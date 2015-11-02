require 'redcarpet'
module ApplicationHelper
	def markdown(text)
		renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
		options = {
			autolink: true,
			no_intra_emphasis: true,
			fenced_code_blocks: true,
			lax_html_blocks: true,
			strikethrough: true,
			superscript: true
		}
		Redcarpet::Markdown.new(renderer, options).render(text).html_safe
	end
end
