class HomeController < ApplicationController
  
  def index
    render html: 'Main Page'
  end

  def about
    render template: 'home/about'
  end
end
