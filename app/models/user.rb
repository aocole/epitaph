class User < ApplicationRecord
  devise :omniauthable, :registerable, :rememberable, :trackable, :omniauth_providers => [:twitter]
  has_one :epitaph

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.username = auth.info.nickname
    end
  end

  before_validation :generate_slug

  def to_param
    slug
  end

  private

  def generate_slug
    return if slug
    while self.class.where(slug: (self.slug = SecureRandom.urlsafe_base64(8))).count > 0
    end
  end

end
