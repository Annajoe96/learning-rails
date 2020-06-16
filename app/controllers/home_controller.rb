class HomeController < ApplicationController

  def index
    if params[:id] == "daniel"
      @array = ["Hello Daniel"]
    else
      @array = ["Anna", "Joe", "Daniel", "Paul"]
    end
  end

end
