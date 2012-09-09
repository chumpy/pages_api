class PagesController < ApplicationController
  respond_to :xml, :json
  inherit_resources
  defaults route_prefix: :api

end
