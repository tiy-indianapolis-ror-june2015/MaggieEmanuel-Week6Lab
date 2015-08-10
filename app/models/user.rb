class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   belongs_to :followable, :polymorphic => true
   belongs_to :follower,   :polymorphic => true


   has_many :posts

   acts_as_followable
   acts_as_follower


   def self.timeline(user)
     following_ids = user.all_following.map(&:id)
     all_ids = following_ids << user.id
     Post.where(user_id: all_ids).order("created_at DESC")
   end






end
