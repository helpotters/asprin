# frozen_string_literal: true

class SearchFormComponentPreview < ViewComponent::Preview
  def default
    render(SearchFormComponent.new)
  end
end
