RSpec.describe 'exercises' do
  let(:params) { { exercise: { name: 'Biceps', day: '1' } } }
  it 'stores exercises for each day' do
    expect { post exercises_path, params: params }.to change { Exercise.count }.by(1)
  end

  it 'saves the name for exercise' do
    post exercises_path, params: params
    expect(Exercise.first.name).to eq 'Biceps'
  end

  it 'save the day for exercise' do
    post exercises_path, params: params
    expect(Exercise.first.weekday).to eq 'Monday'
  end

  it 'provides a form to enter details' do
    get new_exercise_path
    expect(response.body).to include 'Wednesday'
  end

  it 'puts a list of random exercises' do
    Exercise.create!(name: 'Biceps', day: 1)
    get exercises_path
    expect(response.body).to include 'Biceps'
  end

  it 'puts a list of exercises for current day' do
    Exercise.create!(name: 'Legs', day: Time.now.utc.wday + 1)
    Exercise.create!(name: 'Biceps', day: Time.now.utc.wday)
    get exercises_path
    expect(response.body).to include 'Biceps'
    expect(response.body).not_to include 'Legs'
  end


end