FactoryGirl.define do
  factory :epitaph do
    user
    name { Faker::Name.name }
    text do
      case Kernel.rand
      when 0..0.2 then Faker::HarryPotter.quote
      when 0.2..0.4 then Faker::Lorem.sentence
      when 0.4..0.6 then Faker::Friends.quote
      when 0.6..0.8 then Faker::StarWars.quote
      else Faker::TwinPeaks.quote
      end
    end
  end
end
