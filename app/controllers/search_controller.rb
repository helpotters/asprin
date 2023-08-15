class SearchController < ApplicationController
  def suggestions
    @results = search_for_users
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream:
                 turbo_stream.update('suggestions',
                                     partial: 'search/suggestions',
                                     locals: { results: @results })
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
      User.search(params[:query], fields: %i[first_name last_name], operator: 'or', match: :word_start)
    end
  end
end
