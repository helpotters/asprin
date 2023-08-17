module ApplicationHelper
  def markdown(text)
    options = [hard_wrap: true, autolink: true, no_intra_emphasis: true, fenced_code_blocks: true, safe_links_only: true, tables: true, superscript: true,underline: true, highlight: true, quote: true, footnotes: true]
    renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true, prettify: true, filter_html: true, with_toc_data: true)
    markdown = Redcarpet::Markdown.new(renderer, *options)
    markdown.render(text).html_safe
  end
end
