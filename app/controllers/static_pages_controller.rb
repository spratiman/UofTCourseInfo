class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index

  def home
  end
  def index
  end
end
