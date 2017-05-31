# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :prepare_meta_tags

  def prepare_meta_tags(options={})
    return unless request.get?
    site_name   = "Trackr"
    title       = [controller_name, action_name].join(" ")
    description = "The Trackr team creates web software for humans"
    image       = options[:image] || "your-default-image-url"
    current_url = request.url

    # TODO: Use proper values
    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[web software development mobile app],
      twitter: {
        site_name: site_name,
        site: '@thecookieshq',
        card: 'summary',
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      },
      reverse: true
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
end
