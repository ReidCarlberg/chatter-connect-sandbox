require 'HouseholdProductAdapter'

class HomeController < ApplicationController
  def index
  end
  
  def index2
  end

  def index3
    if session['user_hash'] && session['user_hash']['user_id']
      @policies = HouseholdProductAdapter.get_all_products(session['user_hash']['user_id'])
    end
  end
  
  def index4
    
  end
  
  
end
