# frozen_string_literal: true

class SearchFormComponent < ApplicationComponent
  def initialize(results: [])
    @results = results
  end
end
