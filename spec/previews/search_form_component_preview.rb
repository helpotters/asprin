# frozen_string_literal: true

class SearchFormComponentPreview < ViewComponent::Preview
  def default
    user = FactoryBot.create(:user)
    render(SearchFormComponent.new) { |c| c.with_suggestion(results: [user]) }
  end
end
