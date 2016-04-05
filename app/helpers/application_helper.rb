module ApplicationHelper
  def tel_to(text)
    groups = text.to_s.scan(/(?:^\+)?\d+/)
    link_to text, "tel:#{groups.join '-'}"
  end

  def active_class(link_path)
    "active" if request.fullpath.include? link_path
  end

  def class_status(status)
    case status
      when ComputerStatus::ON
        "success"
      when ComputerStatus::OFF
        "warning"
      when ComputerStatus::BANEO
        "danger"
    end
  end
end
