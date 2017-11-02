module GroupsHelper
  def render_group_description(group)
    simple_format(group.description)
  end
  def render_post_content(post)
    simple_format(post.content)
  end
end
