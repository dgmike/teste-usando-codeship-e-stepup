class HomeController < ApplicationController
  def index
    @name = 'Marcelo'
    if 'Michael' == params[:name]
      @name = 'Michael'
    end
    @name = 'Vegeta' if 'Vegeta' == params[:name]
    @name = 'Goku' if 'Goku' == params[:name]
    @name = 'Bulma' if 'Bulma' == params[:name]
    render plain: @name
  end
end
