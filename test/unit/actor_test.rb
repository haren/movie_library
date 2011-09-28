require 'test_helper'

class ActorTest < ActiveSupport::TestCase
  test "sample test cause nothing to validate" do
  	actor = Actor.create
		assert actor.valid?
  end
end
