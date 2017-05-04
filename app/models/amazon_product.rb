# frozen_string_literal: true
class AmazonProduct < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  searchkick word: [:title], callbacks: false

  has_many :amazon_product_histories
  belongs_to :amazon_product_group
  belongs_to :amazon_product_category

  def presenter
    AmazonProductPresenter.new(self)
  end
end
