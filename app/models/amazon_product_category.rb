# frozen_string_literal: true

class AmazonProductCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :amazon_products

  scope :alphabetical, -> { order('name ASC') }
end
