module MarkdownHelper
  def markdown(text)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text)
  end
end
