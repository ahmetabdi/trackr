# frozen_string_literal: true
class ProductUpdaterJob < ApplicationJob
  queue_as :low_priority

  def perform
    puts 'Hello'
  end
end
