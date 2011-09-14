require 'MetadataAdapter'

class MetadataController < ApplicationController
  
  def raw_list_objects
    render :json => MetadataAdapter.list_objects
  end
  
  def list_objects
    @objects = MetadataAdapter.list_objects
  end
  
  def raw_describe_object
    render :json => MetadataAdapter.describe_object(params["name"])
  end
  
  def query_object
    if (params["name"])
      #render :text => MetadataAdapter.query_object(params["name"])
      @records = MetadataAdapter.query_object(params["name"])
    else
      redirect_to "/metadata/list_objects"
    end      
  end
  
  def mass_insert1
    if (params["name"])
      @metadata = MetadataAdapter.describe_object(params["name"])
    else
      redirect_to "/metadata/list_objects"
    end
  end
  
  def mass_insert2
    if (params["name"] && params["qty"])
      redirect_to "/metadata/query_object/" + params["name"]
    else
      redirect_to "/metadata/list_objects"
    end
  end
  
  
  
end
