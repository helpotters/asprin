# frozen_string_literal: true

# app/components/form_button_component.rb
class FormButtonComponent < ViewComponent::Base
  def initialize(form:, visible_label: true, stimulus_target: nil, id:, visible_button: true)
    @form = form
    @id = id
    @visible_label = visible_label
    @stimulus_target = stimulus_target
  end

  def call
    render_button
  end

  private

  attr_reader :form, :label, :visible_label, :stimulus_target, :id, :visible_button

  def render_button
    content_tag(:div, class: "form-control") do
      render_label(@form)
      render_button_input(@form)
    end
  end

  def render_label(f)
    if visible_label
      f.label(id)
    else
      f.label(id, class: "sr-only")
    end
  end

  def render_button_input(f)
    f.button :submit, id: id, class: "bg-blue-500 text-white font-semibold py-2 px-4 rounded-md hover:bg-blue-600 #{visible_button ? '' : 'sr-only'}",
     data: { "form-target": stimulus_target }
  end
end
