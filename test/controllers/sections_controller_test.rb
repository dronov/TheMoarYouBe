require 'test_helper'

class SectionsControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)

    @section = sections(:one)
    @section.course = @course
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create section" do
    assert_difference('Section.count') do
      post :create, section: { content: @section.content, course_id: @section.course.id, number: @section.number, videourl: @section.videourl }
    end

    assert_redirected_to controller: 'backend', action: 'courses' , course_id: @section.course.id
  end

  test "should show section" do
    get :show, id: @section
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @section
    assert_response :success
  end

  test "should update section" do
    patch :update, id: @section, section: { content: @section.content, course_id: @section.course_id, number: @section.number, videourl: @section.videourl }
    assert_redirected_to section_path(assigns(:section))
  end

  test "should destroy section" do
    assert_difference('Section.count', -1) do
      delete :destroy, id: @section
    end

    assert_redirected_to sections_path
  end
end
