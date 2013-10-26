module ArticlesHelper
  def tags_for article
    content_tag :p do
      raw "Tags: " + render(article.tags).to_s + "...\n"
    end
  end
end
