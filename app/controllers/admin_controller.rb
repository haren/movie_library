class AdminController < ApplicationController
  def index
		@total_count = Order.count
		logger.error "total count:#{@total_count}"
  end

end
