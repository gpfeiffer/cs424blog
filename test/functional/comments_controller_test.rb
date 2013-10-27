require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @comment = comments(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: { article_id: @comment.article_id, user_id: @user.id, body: @comment.body, title: @comment.title }
    end

    assert_redirected_to article_path(assigns(:comment).article)
  end

  test "should show comment" do
    get :show, id: @comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment
    assert_response :success
  end

  test "should update comment" do
    put :update, id: @comment, comment: { article_id: @comment.article_id, user_id: @comment.user_id, body: @comment.body, title: @comment.title }
    assert_redirected_to article_path(assigns(:comment).article)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to article_path(assigns(:comment).article)
  end
end
