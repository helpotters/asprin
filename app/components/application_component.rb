# All components inherit from this class.
#
# It includes common patterns for handling data.
class ApplicationComponent < ViewComponent::Base
  def initialize
  end

  InvalidValueError = Class.new(StandardError)

  def fetch_or_fallback(options, selected_value, fallback_value = nil)
    if options.include?(selected_value)
      selected_value
    else
      if ENV["RAILS_ENV"] != "production"
        raise InvalidValueError, <<~MSG
                fetch_or_fallback was called with an invalid value.
                Expected: #{options.inspect}
                Got: #{selected_value.inspect}

                In production, this will not raise an error, but instead fallback to #{fallback_value.inspect}
              MSG
      end
      fallback_value
    end
  end
end
