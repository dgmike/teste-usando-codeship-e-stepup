class HomeController < ApplicationController
  def index
    @name = 'Marcelo'
    if 'Michael' == params[:name]
      @name = 'Michael'
    end
    if 'Vegeta' == params[:name]
      @name = 'Vegeta'
    end
    if 'Goku' == params[:name]
      @name = 'Goku'
    end
    if 'Bulma' == params[:name]
      @name = 'Bulma'
    end
    render plain: @name
  end
end
