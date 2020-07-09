require 'pry'
class User < ActiveRecord::Base
    has_many :memberships
    has_many :gyms, through: :memberships

    def user_memberships_hash
        self.gyms.each_with_object({}) do |value,object| 
          
            object["#{value.gym} - the status is currently #{Membership.find_by(user_id: self.id, gym_id: value).status}"] = value.id
        end
    end

    # def active_memberships
    #     self.gyms.select do |membership|
    #         self.memberships.status == "Active"
    #     end
    # end

    # def suspended_memberships
    #     self.gyms.select do |membership|
    #         self.memberships.status == "Suspended"
    #     end
    #     end
end
