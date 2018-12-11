module ApplicationHelper
  def alert_class(flash_type)
    case flash_type.to_sym
    when :message
      "alert-warning"
    when :success
      "alert-success"
    when :danger
      "alert-danger"
    end
  end
end
