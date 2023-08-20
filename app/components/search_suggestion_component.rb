# frozen_string_literal: true

class SearchSuggestionComponent < ViewComponent::Base
  def initialize(result:, search_suggestion:)
    @result = result
    @search_suggestion = search_suggestion
  end

end
