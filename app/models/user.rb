class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   belongs_to :followable, :class_name => 'Follow', :polymorphic => true
   belongs_to :follower, :class_name => 'Follow', :polymorphic => true

   has_many :posts
   has_many :follows, :through => :passive_follows, :as => :followable_id
   has_many :followers, :through => :active_follows, :as => :follower_id
   acts_as_followable
   acts_as_follower


   def self.timeline(user)
     following_ids = user.all_following.map(&:id)
     all_ids = following_ids << user.id
     Post.where(user_id: all_ids).order("created_at DESC")
   end

   def follow(other_user)
     active_follows.create(followable_id: other_user.id)
   end

   def unfollow(other_user)
     active_follows.find_by(followable_id: other_user.id).destroy
   end

   def following?(other_user)
    following.include?(other_user)
   end




end
