# frozen_string_literal: true
module ApplicationHelper

  def friendly_name(product_name)
    product_name == 'CE' ? 'Consumer Electronics' : product_name
  end
end
