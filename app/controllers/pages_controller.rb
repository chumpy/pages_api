class PagesController < ApplicationController
  respond_to :xml, :json
  inherit_resources
  defaults route_prefix: :api

  def published
    @pages = Page.published
    respond_to do |format|
      format.xml  { render xml:  @pages }
      format.json { render json: @pages }
    end
  end

  def unpublished
    @pages = Page.unpublished
    respond_to do |format|
      format.xml  { render xml:  @pages }
      format.json { render json: @pages }
    end
  end
end
