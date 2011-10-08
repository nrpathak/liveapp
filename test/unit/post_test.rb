require 'test_helper'

class PostTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

  test  "test_invalid_with_empty_attributes"   do
      post = Post.new
      assert_false post.save
  end

  test "test_exist_post_title"  do
      post = Post.new( :post_desc => "a post without title",
                       :votes_count=>2,
                       :creator_id=>1,
                       :weight=> 1440,
                       :reply_id=> nil
                       )
      assert_false post.save
  end

end
