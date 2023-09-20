module CommentsHelper
  def render_nested_comments(comments, level = 0)
    comments.map do |comment|
      content_tag(:div, class: "nested-comment", style: "margin-left: #{20 * level}px;") do
        render(partial: "comments/comment", locals: { comment: comment }) +
          (comment.replies.any? ? render_nested_comments(comment.replies, level + 1) : "")
      end
    end.join.html_safe
  end
end