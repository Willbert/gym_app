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

  it 'returns a list of 4 exercises' do
    10.times{ create(:exercise, day: 4) }
    #Frozen to Thursday
    Timecop.freeze(Time.local(2018, 11, 8, 0, 0, 0)) do
      get exercises_path
    end

    expect(response.body.scan(/<span class="exercise_list">/m).size).to eq 4
  end

  it 'puts a list of exercises for current day' do
    create(:exercise, name: 'Legs', day: 2)
    create(:exercise, name: 'Biceps', day: 3)
    #Frozen to Wednesday
    Timecop.freeze(Time.local(2018, 11, 7, 0, 0, 0)) do
      get exercises_path
    end

    expect(response.body).to include 'Biceps'
    expect(response.body).not_to include 'Legs'
  end

  it 'returns a list of random exercises' do
    10.times{ create(:exercise, day: 2) }
    #Frozen to Tuesday
    Timecop.freeze(Time.local(2018, 11, 6, 0, 0, 0)) do
      get exercises_path
      previous_response_body = response.body
      get exercises_path
      expect(previous_response_body).to_not eq response.body
    end
  end

  it 'returns all exercises if we pass "include=all" ' do
    10.times{ create(:exercise) }
    get exercises_path, params: { include: 'all' }
    expect(response.body.scan(/<span class="exercise_list">/m).size).to eq 10
  end

  it 'add edit button on "include=all"' do
    10.times{ create(:exercise) }
    get exercises_path, params: { include: 'all' }
    expect(response.body.scan(/<span class="btn btn-primary edit-button">/m).size).to eq 10
  end

end