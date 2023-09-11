# frozen_string_literal: true

# NOTE May need refactoring to simply take in a @post object rather than initializing it by itself.
# That way, it'll be able to accept errors. As-is, it does not display errors.
class PostFormComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end
end
