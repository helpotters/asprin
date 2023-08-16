# frozen_string_literal: true

class PostFormComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

end
