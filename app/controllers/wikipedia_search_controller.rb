class WikipediaSearchController < ApplicationController
  def index
    if params[:query]
      @query = params[:query]
      @results = search_wikipedia(@query)
    end
  end

  private

  def search_wikipedia(query)
    # debugger
    response = RestClient.get 'https://en.wikipedia.org/w/api.php', params: {
      action: 'query',
      format: 'json',
      list: 'search',
      srsearch: query 
    }

    data = JSON.parse(response.body)
    data['query']['search']
  end
end
