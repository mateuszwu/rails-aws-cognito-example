class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[cognito_idp]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user_data = auth&.extra&.raw_info

      user.email = user_data.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = user_data.given_name
      user.last_name = user_data.family_name
      user.picture = user_data.picture
    end
  end
end
