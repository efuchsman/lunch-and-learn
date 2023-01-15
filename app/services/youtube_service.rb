class YoutubeService

  def self.conn
    Faraday.new('https://www.googleapis.com')
  end

  def self.videos_of_country(country)
    response = conn.get("/youtube/v3/search?part=snippet&channelId=#{ENV['MR_HISTORY_ID']}&q=#{country}&key=#{ENV['YOUTUBE_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
