class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
    @micropost  = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page],
      per_page: Settings.perpage).news_feed
  end

  def help; end

  def about; end

  def contact; end
end
