class User < ActiveRecord::Base
  has_many :posts, :class_name => "Post"
  has_many :votes, :class_name => "Vote"
    validates :user_name, :uniqueness => true, :presence => true
    validates :password, :presence => true, :length => {:minimum => 6 }
    validates :email, :presence => true, :uniqueness => true
    validates :first_name,:presence => true
    validates :last_name, :presence => true
    validates :admin,:presence =>true,:format => {:with => /^true$|^false$/}
    validates_format_of :last_name, :with => /^([a-z]+)$/i, :message => " can have only alphabets"
    validates_format_of :first_name, :with => /^([a-z]+)$/i, :message => "can have only alphabets"
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                        :message =>"has to be of a@x.y format"
end