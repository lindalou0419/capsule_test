class Sentiment < ApplicationRecord
  before_validation :sentiment_response
  validates :message, :mood, presence: true # => comment out if unnecessary
  validates :message, length: {in: 3..1500}

  def sentiment_response
    query = {"text" => "#{message}"}
    headers = {
      "X-Mashape-Key" => "#{ENV["SENTIMENT_KEY"]}",
      "Accept" => "application/json"
    }

    response = HTTParty.post(
      "https://twinword-sentiment-analysis.p.mashape.com/analyze/",
      :query => query,
      :headers => headers
    )

    self.mood = response["type"]
  end
end
