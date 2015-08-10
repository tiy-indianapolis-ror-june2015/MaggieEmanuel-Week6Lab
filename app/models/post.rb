class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true
<<<<<<< HEAD
  
=======


  def post_length
    errors.add(:body, "of post is too long, can't be longer than 170 characters") unless body.to_s.length < 170
  end
>>>>>>> master

  def self.timeline(user)
    following_ids = user.all_following.map(&:id)
    all_ids = following_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end

end
