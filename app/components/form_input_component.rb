# frozen_string_literal: true

class FormInputComponent < ViewComponent::Base
  def initialize(form:, name:, label:, placeholder: nil)
    @form = form
    @name = name
    @label = label
    @placeholder = placeholder.to_s
  end
end
