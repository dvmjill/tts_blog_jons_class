class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

#this is what the belongs_to thing above makes happen:
#   def user
#     return User.find(self.user_id)
#   end

#this is what the has_many thing above makes happen:
#   def comments
#     return Comments.where(post_id: self.id)
#   end

end
