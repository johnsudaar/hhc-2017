class BadgeSerializer < ActiveModel::Serializer
  attributes :title, :icon, :annual_threshold, :global_threshold, :achived

  def achived
    return false if ! view_context.user_signed_in?

    return view_context.current_user.badges.exists? object

  end
end
