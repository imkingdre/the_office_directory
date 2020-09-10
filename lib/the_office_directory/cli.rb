class TheOfficeDirectory::CLI

    def call
        TheOfficeDirectory::CastScraper.new.send_cast
        welcome_message
    end

    def welcome_message
        puts "Welcome! This is the Office cast directory!!"
        
        play
    end

    def play
        puts "if you would like to learn about the office cast enter Y, or if you want to exit, enter exit"

        input = gets.strip

        case input
        when "Y"
            cast_list
        when "exit"
            exit_message
        else
            puts "Sorry invalid input, please try again."
            play
        end
    end 

    def cast_list
        puts "Which cast member would you like to learn about? enter the number:"
        puts ""
        puts "Office cast memebers:"
        TheOfficeDirectory::Cast.all.each_with_index do |cast, index|
            puts "#{index + 1}. #{cast.name}"
        end
        pick_cast
    end

    def pick_cast
        puts "What cast member would you like to learn more about? enter the number:"

        input = gets.strip
        cast = TheOfficeDirectory::Cast.find(input.to_i)

        cast_info(cast)
    end

    def cast_info(cast)
        puts "------#{cast.name}-----"
        puts "Gender:    #{cast.gender}"
        puts "Status:    #{cast.status}"
        puts "Born:      #{cast.born}"
        puts "Title:     #{cast.title}"
        puts "Learn more at  #{cast.url}"

        play
    end

    def exit_message
        puts "Thank you for checking out the office cast members. Goodbye!"
    end
end