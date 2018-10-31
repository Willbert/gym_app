RSpec.describe Exercise do
  describe '#weekday' do
    it 'gives correct weekday for numeric day' do
      exercise = Exercise.new(day: 1)
      expect(exercise.weekday).to eq 'Monday'
      exercise = Exercise.new(day: 2)
      expect(exercise.weekday).to eq 'Tuesday'
      exercise = Exercise.new(day: 3)
      expect(exercise.weekday).to eq 'Wednesday'
      exercise = Exercise.new(day: 4)
      expect(exercise.weekday).to eq 'Thursday'
      exercise = Exercise.new(day: 5)
      expect(exercise.weekday).to eq 'Friday'
      exercise = Exercise.new(day: 6)
      expect(exercise.weekday).to eq 'Saturday'
      exercise = Exercise.new(day: 7)
      expect(exercise.weekday).to eq 'Sunday'
    end
  end
end