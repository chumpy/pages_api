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

  def publish
    @page = Page.find params[:id]
    @page.update_attribute :published_on, DateTime.current
    respond_to do |format|
      format.xml  { render xml:  @page }
      format.json { render json: @page }
    end
  end

  def total_words
    @total_words = {total_words: Page.find(params[:id]).total_words}
    respond_to do |format|
      format.xml  { render xml:  @total_words }
      format.json { render json: @total_words }
    end
  end
end
