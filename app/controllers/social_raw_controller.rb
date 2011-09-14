require 'ChatterAdapter'
require 'AccountAdapter'

class SocialRawController < ApplicationController
  def raw_feed_me
    render :json => ChatterAdapter.my_news_feed
  end
  
  def raw_follows
    render :json => ChatterAdapter.user_following(session[:user_hash]['user_id'])
  end

  def raw_feed_record
    if params['recordId']
      render :json => ChatterAdapter.record_feed(params['recordId'])
    else
      redirect_to '/social/accounts'
    end
  end
  
  def raw_feed_item
    if params['recordId']
      render :json => ChatterAdapter.feed_item(params['recordId'])
    else
      redirect_to '/social/feed_me'
    end
  end
  
  def raw_users_me
    render :json => ChatterAdapter.users_me
  end
  
  def get_accounts
    @accounts = AccountAdapter.get_first_hundred
  end
  
  
  
end
