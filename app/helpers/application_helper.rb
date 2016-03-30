module ApplicationHelper
  def tel_to(text)
    groups = text.to_s.scan(/(?:^\+)?\d+/)
    link_to text, "tel:#{groups.join '-'}"
  end

  def active_class(link_path)
    "active" if request.fullpath.include? link_path
  end
end
