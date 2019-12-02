class User < ApplicationRecord
    has_many :posts
    # follower_follows "names" the Follow join table for accessing through the follower association
    has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow" 
    # source: :follower matches with the belong_to :follower identification in the Follow model 
    has_many :followers, through: :follower_follows, source: :follower

    # followee_follows "names" the Follow join table for accessing through the followee association
    has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"    
    # source: :followee matches with the belong_to :followee identification in the Follow model   
    has_many :followees, through: :followee_follows, source: :followee


    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    validates :password_confirmation, confirmation: true
    validates :age, numericality: true

end