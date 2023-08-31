# frozen_string_literal: true

class SearchFormComponent < ApplicationComponent
  renders_many :suggestions, "SearchSuggestionComponent"

  def initialize
  end
end
