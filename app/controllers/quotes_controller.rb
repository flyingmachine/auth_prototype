class QuotesController < ApplicationController
  def show
    @quote = Quote.random
  end
  
end
