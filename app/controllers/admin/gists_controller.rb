class Admin::GistsController < ApplicationController
  layout "admin"
  def show;end

  def index
    @gists = Gist.all
  end
end
