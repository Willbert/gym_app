FactoryBot.define do
  factory :exercise do
    sequence(:name, %w[Biceps Legs Arms Back Triceps Shoulders Quads Abs Calves Core].cycle) { |name| name }
    sequence(:day, (1..7).cycle) { |day| day }
  end
end