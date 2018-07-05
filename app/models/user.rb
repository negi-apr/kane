class User < ApplicationRecord
  has_many :group_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        name: auth.info.name,
        email: auth.info.email,
        thumbnail: auth.info.image,
        password: Devise.friendly_token[0,20]
      )
    end

    user
  end

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@dummy-email.com"
  end

end
