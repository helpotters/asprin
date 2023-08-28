class ApplicationController < ActionController::Base
  after_action :update_user_online, if: :user_signed_in?
  before_action :configure_sign_up_params, if: :devise_controller?

  def turbo_stream_remove(key)
    @turbo_stream_actions ||= []
    @turbo_stream_actions << turbo_stream.remove(key)
  end

  def turbo_stream_prepend(key, component)
    @turbo_stream_actions ||= []
    @turbo_stream_actions << turbo_stream.prepend(key, view_context.render(component))
  end

  def turbo_stream_append(key, component)
    @turbo_stream_actions ||= []
    @turbo_stream_actions << turbo_stream.append(key, view_context.render(component))
  end

  def turbo_stream_update(key, component)
    @turbo_stream_actions ||= []
    @turbo_stream_actions << turbo_stream.update(key, view_context.render(component))
  end

  def turbo_stream_replace(key, component)
    @turbo_stream_actions ||= []
    @turbo_stream_actions << turbo_stream.replace(key, view_context.render(component))
  end

  def actions
    @turbo_stream_actions
  end

  private

  def update_user_online
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
