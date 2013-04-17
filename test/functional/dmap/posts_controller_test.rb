require 'test_helper'

module Dmap
  class PostsControllerTest < ActionController::TestCase
    setup do
      @post = posts(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:posts)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create post" do
      assert_difference('Post.count') do
        post :create, post: { active: @post.active, description: @post.description, description_short: @post.description_short, published_at: @post.published_at, slug: @post.slug, state: @post.state, title: @post.title }
      end
  
      assert_redirected_to post_path(assigns(:post))
    end
  
    test "should show post" do
      get :show, id: @post
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @post
      assert_response :success
    end
  
    test "should update post" do
      put :update, id: @post, post: { active: @post.active, description: @post.description, description_short: @post.description_short, published_at: @post.published_at, slug: @post.slug, state: @post.state, title: @post.title }
      assert_redirected_to post_path(assigns(:post))
    end
  
    test "should destroy post" do
      assert_difference('Post.count', -1) do
        delete :destroy, id: @post
      end
  
      assert_redirected_to posts_path
    end
  end
end
