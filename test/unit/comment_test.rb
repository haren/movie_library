require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "empty_content_fail" do
  	komc = Comment.create(:content => "")
  	komc2 = Comment.create(:content => nil)
		komc3 = Comment.create(:content => "Sweet Home Alabama!")
		assert komc.invalid?
		assert komc2.invalid?
		assert komc3.valid?
  end
end
