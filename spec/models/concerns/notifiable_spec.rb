# frozen_string_literal: true

require 'rails_helper'

shared_examples 'notifiable' do
  it { is_expected.to have_many(:notifications) }
end
