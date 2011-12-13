require HouseholdProductAdapter

class HomeController < ApplicationController
  def index
  end
  
  def index2
  end

  def index3
    @policies = HouseholdProductAdapter.get_all_products
  end
  
end
