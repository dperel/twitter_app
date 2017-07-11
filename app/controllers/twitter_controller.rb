class TwitterController < ApplicationController


	def pull

		handle = params[:handle]

		cached_tweets = Rails.cache.read(handle)

		if cached_tweets.nil?

			# Pull tweets
			# @tweets = pull_tweets(handle)

			# Write tweets to cache
			hash = {}
			hash[handle] = {tweets: response, timestamp: Time.now }
			Rails.cache.write(hash)

		else

			# Determine if cached tweets are more than 5 min old

			if cached_tweets["timestamp"] < 5.minutes.ago

				# Pull tweets
				# @tweets = pull_tweets(handle)

			else

				@tweets = cached_tweets["tweets"]

			end

		end

	end


private

	def get_tweets(handle)

		# use twitter gem to pull tweets

		# if error, return with error message in order to prevent caching

	end

end
