# frozen_string_literal: true

class AvatarComponent < ApplicationComponent
  # `Avatar` represents users in asprin
  #
  # - Set `size` to proportionately adjsut height and width in pixels.
  # - Set `shape` to use either a circle or a rounded square.
  # - Always set `alt`.
  # @accessibility
  # Images should have alt-text  that describe the information or function.
  # Examples of usage:
  # - As a link to a user profile, the alt-text should be `@helpotters profile`
  # rather than `@helpotters`

  DEFAULT_SIZE = 10
  DEFAULT_SHAPE = :circle
  SHAPE_OPTIONS = [DEFAULT_SHAPE, :square].freeze

  SIZE_OPTIONS = [DEFAULT_SIZE, 16, 24, 32, 40, 48, 80].freeze

  def initialize(src:, alt: nil, size: DEFAULT_SIZE, shape: DEFAULT_SHAPE, href: nil, **system_arguments)
    @href = href
    @size = fetch_or_fallback(SIZE_OPTIONS, size.to_i, DEFAULT_SIZE)
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

  def deny_args(**args)
    allowed_keys = [:height, :width, :classes]
    args.select { |key, _| allowed_keys.include?(key) }
  end

  def set_shape(shape)
    case shape
    when :circle then "rounded-full"
    when :square then "rounded-md"
    end
  end
end
