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

  def create
    @action = 'calc'
    if params[:a]
      a = params[:a]
    else
      a = 1
    end
    if params[:b]
      b = params[:b]
    else
      b = 1
    end
    @calc = Calc.new.sum a, b
  end
end
