# frozen_string_literal: true

class AvatarComponent < ViewComponent::Base
  # `Avatar` represents users in asprin
  #
  # - Set `size` to proportionately adjsut height and width in pixels
  #
  # @accessibility
  # Images should have text-alt that describe the information or function.
  # Examples of usage:
  # - As a link to a user profile, the alt-text should be `@helpotters profile`
  # rather than `@helpotters`

  DEFAULT_SIZE = 10
  DEFAULT_SHAPE = :circle
  SHAPE_OPTIONS = [DEFAULT_SHAPE, :square].freeze

  SIZE_OPTIONS = [16, DEFAULT_SIZE, 24, 32, 40, 48, 80].freeze

  def initialize(src:, alt: nil, size: DEFAULT_SIZE, shape: DEFAULT_SHAPE, href: nil, **system_arguments)
    @href = href
    @size = fetch_or_fallback(SIZE_OPTIONS, size, DEFAULT_SIZE)
    @system_arguments = deny_args(**system_arguments)
    @shape = set_shape(fetch_or_fallback(SHAPE_OPTIONS, shape, DEFAULT_SHAPE))
    @src = src
    @alt = alt
    @shape = set_shape(shape)
    @classes = tailwind_classes(
      system_arguments[:classes],
      "avatar",
      "#{@shape}", # adjust this
      "object-cover",
      "w-#{@size}",
      "h-#{@size}"
    )
  end

  private

  def tailwind_classes(*class_lists)
    class_lists.compact.join(" ")
  end

  def fetch_or_fallback(options, selected_value, fallback_value)
    if options.include?(selected_value)
      selected_value
    else
      fallback_value
    end
  end

  def deny_args(**args)
    allowed_keys = [:tag, :src, :alt, :height, :width, :classes]
    args.select { |key, _| allowed_keys.include?(key) }
  end

  def set_shape(shape)
    case shape
    when :circle
      "rounded-full"
    when :square
      "rounded-md"
    end
  end
end
