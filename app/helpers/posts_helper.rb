module PostsHelper
  def can_vote?(user_id,post_id,creator_id)
       if !user_id.nil? && creator_id != user_id
        vote=Vote.find_by_user_id_and_post_id(user_id,post_id)
        if vote.nil?
          return true
        end
      end
      false
  end

  def number_of_replies(post_id)
    count=Post.find_all_by_reply_id(post_id).size
  end

  def get_user_name(user_id)
    user=User.find(user_id)
    user.first_name+" "+user.last_name
  end
end
