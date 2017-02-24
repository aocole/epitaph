class User < ApplicationRecord
  devise :omniauthable, :registerable, :rememberable, :trackable, :omniauth_providers => [:twitter]
  has_one :epitaph

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.username = auth.info.nickname
    end
  end

end
