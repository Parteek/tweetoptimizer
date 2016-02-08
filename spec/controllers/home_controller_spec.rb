require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views
  context 'home page' do
    it 'should render the home page asking for twitter username or id' do
      get :index
      expect(response.code).to eq('200')
      expect(response.body).to include('Username or Twitter ID')
    end
  end

  context 'Get the results from twitter' do
    it 'should render with no data' do
      post :best_day_time, {twitter: {username: ''}}
      expect(response.code).to eq('200')
      expect(response.body).to include('Username or Twitter ID')
      expect(response.body).to include('There is no data to make any conclusion.')
    end

    it 'should render with no results' do
      post :best_day_time, {twitter: {username: 'r-123213-12321'}}
      expect(response.code).to eq('200')
      expect(response.body).to include('Username or Twitter ID')
      expect(response.body).to include('Could not fetch the results')
    end

    it 'should render with no results' do
      post :best_day_time, {twitter: {username: 'parteek_singla'}}
      expect(response.code).to eq('200')
      expect(response.body).to include('Username or Twitter ID')
      expect(response.body).to include('<span class="text-primary">parteek_singla</span> should tweet on <span class="text-primary">Monday</span> and in between <span class="text-primary">21:00 - 22:00</span> for best performance.')
    end

  end
end
