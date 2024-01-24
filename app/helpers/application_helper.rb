module ApplicationHelper
    def render_error_messages(model, attribute)
      if model.errors[attribute].any?
        content_tag(:div, model.errors[attribute].to_sentence, class: 'text-danger')
      end
    end
end