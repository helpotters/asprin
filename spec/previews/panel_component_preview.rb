# frozen_string_literal: true

class PanelComponentPreview < ViewComponent::Preview

  # Default Panel container
  # ---------------
  # For main content that has the /right/ amount of padding
  #
  # @param panel select { choices: [default, well] }
  # @param size range { min: 1, max: 5, step: 1 }
  def default(panel: "default", size: 1)
    bg_colors = %w[bg-gray-200 bg-red-500 bg-primary-400]
    render PanelComponent.with_collection(bg_colors, panel: panel) do
      content_tag(:p, "Hello", class: "text-#{size}xl") +
      content_tag(:div, "Test", class: "avatar placeholder bg-gray-400 h-10 w-10 rounded-full justify-center items-middle")
    end
  end
end
