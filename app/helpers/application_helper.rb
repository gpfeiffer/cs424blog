module ApplicationHelper
  def title(page_title, show_title = true)
    content_for(:title) { page_title.to_s }
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end

  def tag_cloud(tags, classes)
    max = tags.map(&:count).map(&:to_i).max
    tags.each do |tag|
      index = tag.count.to_f / max * classes.size
      yield(tag, classes[index.ceil-1])
    end
  end
end
