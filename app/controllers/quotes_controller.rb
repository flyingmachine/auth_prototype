class QuotesController < ApplicationController
  def show
    render :text => Quote.random
  end
  
end
