require 'rails_helper'

RSpec.describe User, type: :model do
  it "generates a slug" do
    e = build :user
    expect{e.save!}.not_to raise_error
    expect(e.slug).not_to be_nil
  end
end
