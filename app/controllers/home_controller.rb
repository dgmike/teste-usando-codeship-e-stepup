class HomeController < ApplicationController
  def index
    @name = 'Marcelo'
    if 'Michael' == params[:name]
      @name = 'Michael'
    end
    render plain: @name
  end
end
