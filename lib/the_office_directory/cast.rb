class TheOfficeDirectory::Cast
    attr_accessor :url, :name, :gender, :born, :status, :title,
    @@all = []

    def self.new_cast(cast)
        self.new(
            cast.css("a figure figcaption.category-page__trending-page-title").text,
            "https://theoffice.fandom.com#{cast.css("a").attribute("href").text
        )
    end

    def initialize(name=nil, url=nil)
        @name = name
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find(index)
        @@all[index -1]
    end

    def doc
        doc ||= Nokogiri::HTML(open(self.url))

    end

    def gender
        @gender ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=gender] div.pi-data-value.pi-font").text
        
    end
    
    def status
        @status ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=status] div.pi-data-value.pi-font").text
    end

    def born
        @born ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=born] div.pi-data-value.pi-font").text
    end

    def title
        @title ||= doc.css("div.pi-item.pi-data.pi-item-spacing.pi-border-color[data-source=title] div.pi-data-value.pi-font").text
    end
end