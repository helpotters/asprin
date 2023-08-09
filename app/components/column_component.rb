# frozen_string_literal: true

class ColumnComponent < ViewComponent::Base
  TYPES = %w[aside main].freeze

  def initialize(type:)
    @type = type
    raise ArgumentError, 'Invalid column type' unless TYPES.include?(@type)
  end

  def call
    case @type
    when 'aside'
      render_aside
    when 'main'
      render_main
    end
  end

  private

  def render_aside
    content_tag :aside, '', class: 'sticky top-8 w-44 shrink-0 lg:block' do
      content
    end
  end

  def render_main
    content_tag :main, '', class: 'flex-1' do
      content
    end
  end
end
