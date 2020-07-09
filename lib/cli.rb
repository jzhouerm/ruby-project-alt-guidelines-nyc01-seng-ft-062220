require 'pry'
require 'tty-prompt'

class CLI
    @@current_user = ""
    @@gym = ""
    @@prompt = TTY::Prompt.new
    def self.run
        CLI.greet
    end

    def self.greet
        system "clear"
        puts "+-+-+-+-+-+-+-+-+-+"
        puts "|S|W|O|L|E|M|A|T|E|"
        puts "+-+-+-+-+-+-+-+-+-+"
        puts "Hey there! Welcome to Swolemate - your resourceful gym companion! :)"
        selection = @@prompt.select("Please select the following:", ["Existing User", "New User"])
            case selection
            when "Existing User"
                @@current_user = ""
                puts "Welcome Back! Please enter enter your name."
                user_name = gets.chomp
                name_check = User.find { |user| user.user.downcase == user_name.downcase }
                @@current_user = User.find_or_create_by(user: user_name)
                self.menu
            when "New User"
                @@current_user = ""
                puts "Welcome Back! Please enter enter your name."
                user_name = gets.chomp
                name_check = User.find { |user| user.user.downcase == user_name.downcase }
                @current_user = User.find_or_create_by(user: user_name)
                self.menu
            end #case selection
    end #self.greet

    def self.menu
        selection1 = @@prompt.select("What would you like to do today?", ["Find a Gym", "My Current Membership(s)", "Cancel Membership", "Exit"])
        case selection1
        when "Find a Gym" #returns city names
            self.location
        when "My Current Membership(s)"
            self.current_membership
        when "Cancel Membership"
            self.cancel_membership
        when "Exit"
            self.exit
            
        end #selection1
    end #self.menu
    
    def self.cancel_membership
        membership = @@current_user.membership.find_by(gym_id: gym.id)
        #membership.destroy
    end

    def self.current_membership
        system "clear"
        @@current_user.memberships.find_by(gym_id: @@gym.id)
    end

    def active_memberships
        @@current_user.memberships.select do |membership|
            membership.status == "Active"
        end
    end

    def suspended_memberships
        @@current_user.memberships.select do |membership|
            membership.status == "Suspended"
        end
    end

    def self.location
        system "clear"
        selection = @@prompt.select("Pick a Borough.", ["Brooklyn", "Manhattan", "Staten Island", "Bronx", "Queens", "Main Menu"])

        case selection 
        when "Main Menu"
            self.run
        else
            gym_boros = Gym.all.select{|gym| gym.location == selection}
        end #selection
        
        gym_names = gym_boros.map {|c| c.gym}
        selection = @@prompt.select("Choose a gym.", gym_names)
        @@gym = Gym.find_by(gym: selection)

        system "clear"
        puts "Awesome. You picked #{@@gym.gym}."

        selection2 = @@prompt.select("What would you like to do?", ["Get Membership for this Gym", "Choose another Gym", "Main Menu"])
                case selection2
                when "Get Membership for this Gym"
                    register_gym(@@gym)   #write a method for this
                when "Choose another Gym" 
                    self.location
                when "Main Menu"
                    self.run
                end #selection2
    end #self.location

    def self.register_gym(new_gym)
        if @@current_user.gyms.include?(new_gym)
            puts "Looks like you're already a member of this gym."
        else 
            Membership.create(user_id: @@current_user.id, gym_id: new_gym.id, status: "Active") #WORKS
            puts "Congrats! You are now a member of #{new_gym}!"
        end #if
    end #self.register_gym


    def self.exit
        puts `clear`
        puts "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
        puts "|H|A|V|E| |A| |G|R|E|A|T| |D|A|Y|!|" 
        puts "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
    end #self.exit

end #Class CLI

