module ApplicationHelper
  GRAVATAR = "http://www.gravatar.com/avatar/%{hash}?s=%{size}&d=wavatar"
  def gravatar_tag(player, size = 20)
    image_tag GRAVATAR % {hash: player.email_md5, size: size}, class: "avatar"
  end
end
