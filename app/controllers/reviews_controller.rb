class ReviewsController < ApplicationController
  before_action :check_for_logged_in, only: [:new, :create, :edit, :update]
end
