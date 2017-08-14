module WikisHelper
    def user_is_authorized_for_wikis?
    current_user
end

 def markdown(text)
    extensions = [:tables, :fenced_code_blocks, :autolink, :strikethrough, :underline, :highlight, :quote, :footnotes]
Markdown.new(text, extensions).to_html.html_safe
end
end
