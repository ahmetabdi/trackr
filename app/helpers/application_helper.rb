# frozen_string_literal: true

module ApplicationHelper
  def friendly_name(product_name)
    return 'Consumer Electronics' if product_name == 'CE'
    return 'Other' if product_name.nil?
    product_name
  end
end
