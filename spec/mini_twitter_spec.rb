require File.dirname(__FILE__) + '/spec_helper.rb'

FEED = 'http://twitter.com/statuses/user_timeline/3922901.rss'

describe MiniTwitter do
  
  before(:each) do
    @twitter = MiniTwitter::Feed.new(FEED)
  end
  
  it "should exists" do
    @twitter.class.should == MiniTwitter::Feed
  end
  
  it "should have items" do
    @twitter.items.size.should > 0
    @twitter.items.first.class.should == MiniTwitter::Item
    @twitter.items.each do |i|
      puts "#{i.date} --- #{i.title} --- #{i.url}"
    end
  end
  
end