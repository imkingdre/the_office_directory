class TheOfficeDirectory::CastScraper

    def open_page

        Nokogiri::HTML(open("https://theoffice.fandom.com/wiki/Category:Characters"))

    end

    def get_cast

        self.open_page.css("div#WikiaArticle.WikiaArticle ul.category__trending-pages li.category__trending-page")

    end

    def send_cast
        self.get_cast.each do |cast|
            TheOfficeDirectory::Cast.new_cast(cast)
        end
    end
end