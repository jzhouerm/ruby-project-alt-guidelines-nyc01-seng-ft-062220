require 'pry'
class User < ActiveRecord::Base
    has_many :memberships
    has_many :gyms, through: :memberships

    # def self.tty_prompt
    #     TTY::Prompt.new
    # end

    

    # def current_membership
    #     self.membership
    # end

end
