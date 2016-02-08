class HomeController < ApplicationController
  #before_action :set_twitter_params, only: [:best_day_time]

  def index

  end

  def best_day_time
    begin
      response = TC.followers(twitter_params[:username])
      @result = find_best_day_and_time(response)
    rescue
      @error = 'Could not fetch the results'
    end
  end

  private

  def twitter_params
    params.require(:twitter).permit(:username)
  end

  #params data is the followers list
  def find_best_day_and_time(data)
    result = {}
    if data.present?
      best_day, best_time = Hash.new(0), Hash.new(0)

      days = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]

      day, time = initialize_day_hash(days), initialize_time_hash

      data.each do |follower|
        if follower.status.present?
          # convert the string into date
          last_tweet_date = DateTime.parse follower.status.created_at.to_s

          # fetch the hour of the date, increment the count for that hour and set the best time
          last_tweet_hour = "#{last_tweet_date.hour}:00 - #{last_tweet_date.hour+1}:00"
          time[last_tweet_hour] += 1
          if time[last_tweet_hour] > best_time[:count]
            best_time[:count] = time[last_tweet_hour]
            best_time[:value] = last_tweet_hour
          end

          # fetch the day of the date, increment the count for that day and set the best day
          last_tweet_day = days[last_tweet_date.wday]
          day[last_tweet_day] += 1
          if day[last_tweet_day] > best_day[:count]
            best_day[:count] = day[last_tweet_day]
            best_day[:value] = last_tweet_day
          end
        end
      end
      result[:day] = day
      result[:best_day] = best_day
      result[:time] = time
      result[:best_time] = best_time
    end
    result
  end

  # set 0 for all the days in the week.
  def initialize_day_hash(days)
    day = {}
    days.each do |d|
      day[d] = 0
    end
    day
  end

  # set 0 for all the hour ranges in a day.
  def initialize_time_hash
    time = {}
    (0..23).each do |hr|
      time["#{hr}:00 - #{hr+1}:00"] = 0
    end
    time
  end
end