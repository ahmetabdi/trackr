# frozen_string_literal: true

module ApplicationHelper
  def friendly_name(product_name)
    return 'Consumer Electronics' if product_name == 'CE'
    return 'Other' if product_name.nil?
    product_name
  end

  def flash_class(level)
    case level
    when 'success' then 'ui positive message'
    when 'error' then 'ui negative message'
    when 'notice' then 'ui info message'
    else
      'ui warning message'
    end
  end
end
