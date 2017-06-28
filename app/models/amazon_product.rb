# frozen_string_literal: true

class AmazonProduct < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  searchkick word: [:title], callbacks: false

  scope :random, -> { order('RANDOM()') }

  has_many :amazon_product_histories
  belongs_to :amazon_product_group
  belongs_to :amazon_product_category

  has_many :watch_lists
  has_many :watched_users, through: :watch_lists, source: :user

  def presenter
    AmazonProductPresenter.new(self)
  end

  def self.total_savings
    AmazonProduct.select(:id, :current_price).map { |p| p.amazon_product_histories.maximum(:price).to_f - p.current_price.to_f }.sum
  end
end
