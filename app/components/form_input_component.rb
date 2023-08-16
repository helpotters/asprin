# frozen_string_literal: true

class FormInputComponent < ViewComponent::Base
  def initialize(form:, name:, label:, placeholder: nil, action: [])
    @form = form
    @name = name
    @label = label
    @placeholder = placeholder.to_s
    @action = action
  end
end
