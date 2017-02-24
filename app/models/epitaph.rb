class Epitaph < ApplicationRecord
  belongs_to :user

  before_validation :generate_slug

  private

  def generate_slug
    while self.class.where(slug: (self.slug = SecureRandom.urlsafe_base64(8))).count > 0
    end
  end

end
