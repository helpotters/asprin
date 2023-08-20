# frozen_string_literal: true

class SearchSuggestionComponent < ViewComponent::Base
  def initialize(results:, search_suggestion: nil)
    @results = results
    @search_suggestion = search_suggestion
  end

end
