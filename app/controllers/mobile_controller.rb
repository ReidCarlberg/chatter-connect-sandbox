require 'HouseholdProductAdapter'

class MobileController < ApplicationController
  layout "mobile"
  def index
      if session['user_hash'] && session['user_hash']['user_id']
        @policies = HouseholdProductAdapter.get_all_products(session['user_hash']['user_id'])
      end
  end

end
