class Quote
  include HTTParty
  base_uri 'http://www.iheartquotes.com/api/v1/random'
  
  class << self
    def random
      get("/").body
    end
  end
end