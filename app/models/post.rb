class Post < ActiveRecord::Base

 belongs_to :user, :class_name => "User", :foreign_key => "creator_id"
 belongs_to :post, :class_name => "Post", :foreign_key => "reply_id"
 has_many :votes, :class_name => "Vote"
 validates :post_title,
           :presence => true
 validates :votes_count,
           :presence => true,
           :numericality => {:greater_than_or_equal_to => 0}
 validates :weight,
           :numericality => {:greater_than_or_equal_to => 0},
           :presence => true
end
