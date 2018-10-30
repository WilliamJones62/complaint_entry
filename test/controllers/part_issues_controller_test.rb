require 'test_helper'

class PartIssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part_issue = part_issues(:one)
  end

  test "should get index" do
    get part_issues_url
    assert_response :success
  end

  test "should get new" do
    get new_part_issue_url
    assert_response :success
  end

  test "should create part_issue" do
    assert_difference('PartIssue.count') do
      post part_issues_url, params: { part_issue: { issue_id: @part_issue.issue_id, notes: @part_issue.notes, part_id: @part_issue.part_id, pictures: @part_issue.pictures } }
    end

    assert_redirected_to part_issue_url(PartIssue.last)
  end

  test "should show part_issue" do
    get part_issue_url(@part_issue)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_issue_url(@part_issue)
    assert_response :success
  end

  test "should update part_issue" do
    patch part_issue_url(@part_issue), params: { part_issue: { issue_id: @part_issue.issue_id, notes: @part_issue.notes, part_id: @part_issue.part_id, pictures: @part_issue.pictures } }
    assert_redirected_to part_issue_url(@part_issue)
  end

  test "should destroy part_issue" do
    assert_difference('PartIssue.count', -1) do
      delete part_issue_url(@part_issue)
    end

    assert_redirected_to part_issues_url
  end
end
