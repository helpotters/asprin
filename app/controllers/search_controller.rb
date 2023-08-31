class SearchController < ApplicationController
  def suggestions
    @results = search_for_users
    respond_to do |format|
      format.turbo_stream do
        turbo_stream_replace("suggestions", SearchSuggestionComponent.new(results: @results))
        render turbo_stream: actions
      end
    end
  end

  def index
  end

  private

  def search_for_users
    if params[:query].blank?
      User.all
    else
      User.search(params[:query], fields: [:first_name, :last_name], operator: "or", match: :word_start, misspellings: { below: 3 }, limit: 5)
    end
  end
end
