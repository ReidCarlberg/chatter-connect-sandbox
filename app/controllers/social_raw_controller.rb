require 'ChatterAdapter'
require 'AccountAdapter'

class SocialRawController < ApplicationController
  def raw_feed_me
    render :text => ChatterAdapter.my_news_feed
  end
  
  def raw_follows
    render :text => ChatterAdapter.user_following(session[:user_hash]['user_id'])
  end

  def raw_feed_record
    if params['recordId']
      render :text => ChatterAdapter.record_feed(params['recordId'])
    else
      redirect_to '/social/accounts'
    end
    
  end
  
  def raw_users_me
    render :text => ChatterAdapter.users_me
  end
  
  def get_accounts
    @accounts = AccountAdapter.get_first_hundred
  end
  
  
  
end
