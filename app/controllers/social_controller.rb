require 'ChatterAdapter'

class SocialController < ApplicationController
  def index
    
  end
  
  def update_status
    ChatterAdapter.update_status(params['new_status'])
    redirect_to '/social/feed_me'
  end
  
  def update_comment
    ChatterAdapter.update_comment(params['feed'], params['comment'])
    redirect_to '/social/feed_me_comments'
  end
  
  def feed_me
    @items = ChatterAdapter.my_news_feed
  end
  
  

end
