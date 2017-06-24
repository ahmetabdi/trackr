class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    prepare_meta_tags(title: 'Profile', reverse: true)
  end

  def watch_list
    prepare_meta_tags(title: 'Watch List', reverse: true)
  end
end
