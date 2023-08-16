# frozen_string_literal: true

class ColumnComponentPreview < ViewComponent::Preview

  def with_main_content
    render ColumnComponent.new(type: "main") do
      "Nested rendering is broken in Previews."
    end
  end
end
