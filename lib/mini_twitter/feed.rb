module MiniTwitter
  
  class Item
    
    attr_reader :title, :date, :url
    
    def initialize( title, date, url)
      @title,@date,@url = title, date, url
    end
    
  end
  
  class Feed

    def initialize(feed_url)
      @url = feed_url
    end

    def items
      @items ||= begin
        (doc/'item').collect do |item|
          MiniTwitter::Item.new( (item/'title').text, (item/'pubdate').text, (item/'guid').text )
        end
      end
    end

    protected

    def doc
      @doc ||= Hpricot(open( @url ))
    end

  end
  
  
end
