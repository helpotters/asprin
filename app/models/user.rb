# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar                 :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :text
#  image                  :string
#  last_name              :text
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  post_id                :bigint
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_post_id               (post_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
class User < ApplicationRecord
  searchkick word_start: %i[first_name last_name], callbacks: :async

  has_many :posts, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id, dependent: :destroy
  has_many :friends, through: :friendships, source: :friend

  # has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[discord github]

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name=(name)
    name = name.split(" ")
    first_name = name[0]
    last_name = name[1]
  end

  def self.from_omniauth(auth)
    logger.debug auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      logger.debug user
      user.full_name = auth.info.name
      # user.nickname = auth.info.nickname
      # user.profile_url = auth.info.urls.GitHub
      user.email = auth.info.email if auth.info.email.present?
      user.image = auth.info.image
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  def online?
    # updated_at > 2.minutes.ago
  end
end
