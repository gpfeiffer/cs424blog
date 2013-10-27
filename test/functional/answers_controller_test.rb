require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @answer = answers(:one)
    @comment = comments(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answers)
  end

  test "should get new" do
    get :new, comment_id: @comment.id
    assert_response :success
  end

  test "should create answer" do
    assert_difference('Answer.count') do
      post :create, answer: { body: @answer.body, comment_id: @answer.comment_id, user_id: @answer.user_id }
    end

    assert_redirected_to article_path(assigns(:answer).comment.article)
  end

  test "should show answer" do
    get :show, id: @answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @answer
    assert_response :success
  end

  test "should update answer" do
    put :update, id: @answer, answer: { body: @answer.body, comment_id: @answer.comment_id, user_id: @answer.user_id }
    assert_redirected_to article_path(assigns(:answer).comment.article)
  end

  test "should destroy answer" do
    assert_difference('Answer.count', -1) do
      delete :destroy, id: @answer
    end

    assert_redirected_to article_path(assigns(:answer).comment.article)
  end
end
