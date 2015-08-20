module ApplicationHelper
  include ERB::Util

  def auth_token
    <<-HTML.html_safe
      <input
        type="hidden"
        name="authenticity_token"
        value="#{form_authenticity_token}">
    HTML
  end

  def ugly_lyrics(lyrics)
    lyrics = lyrics.split("\n")

    html = "<pre>"

    lyrics.each do |line|
      html +="&#9835#{h(line)}"
    end

    html +="</pre>"

    html.html_safe
  end
end
