# frozen_string_literal: true

class PanelComponent < ApplicationComponent
  with_collection_parameter :color

  def initialize(panel: "default", color: "bg-white", justification: "justify-center text-center")
    @color = color
    @panel = panel
    @justification = justification
  end

  attr_reader :panel, :color, :justification

  def call
    case panel
    when "default"
      narrow_constrained
    when "well"
      well
    end
  end

  private

  def well
    content_tag(:div, class: "overflow-hidden rounded-lg #{color}") do
      content_tag(:div, class: "px-4 py-5 sm:p-6 #{justification}") do
        content
      end
    end
  end

  def narrow_constrained
    content_tag(:div, class: "mx-auto min-w-screen px-4 sm:px-6 lg:px-8 #{color}") do
      content_tag(:div, class: "mx-auto max-w-3xl #{justification}") do
        content
      end
    end
  end
end
