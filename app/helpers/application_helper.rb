module ApplicationHelper
   def icon(icon_name)
    tag.i(class: ["bi", "bi-#{icon_name}"])
  end

  def icon_with_text(icon_name, text)
    tag.span(icon(icon_name), class: "me-2") + tag.span(text)
  end

  def nav_link_to(name, path, anchor: nil)
    is_current_page = current_page?(path)
    active_anchor = is_current_page && anchor.present? ? "##{anchor}" : nil
    final_path = is_current_page && anchor.present? ? active_anchor : path

    if anchor && !is_current_page
      final_path = "#{path}##{anchor}"
    end

    link_class = "nav-link"
    link_class += " active" if active_anchor && path != root_path
    
    link_to name, final_path, class: link_class
  end
end
