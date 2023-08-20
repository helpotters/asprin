# frozen_string_literal: true

class SearchFormComponent < ViewComponent::Base
  def initialize(results: [])
    @results = results
  end
end
