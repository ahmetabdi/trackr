# frozen_string_literal: true

class AmazonProductGroup < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :amazon_products

  scope :alphabetical, -> { order('name ASC') }
end
