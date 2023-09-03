# frozen_string_literal: true

class FlashComponent < ApplicationComponent
  TYPES = {
    success: "success",
    error: "error",
    warning: "warning",
    info: "info",
    notice: "neutral",
  }

  DEFAULT_TYPE = :notice

  def initialize(**system_arguments)
    @type = fetch_or_fallback(TYPES, system_arguments[:type], DEFAULT_TYPE)
    @message = system_arguments[:message]
    @type_class = TYPES[@type]
  end

  def render?
    @message.present?
  end
end
