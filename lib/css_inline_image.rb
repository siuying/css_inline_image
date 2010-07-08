# CssInlineImage
Mime::Type.register "image/jpg", :jpg
Mime::Type.register "image/png", :png
Mime::Type.register "image/gif", :gif

ActionView::Helpers::AssetTagHelper.module_eval do  
  def join_asset_file_contents(paths)
    paths.collect do |path| 
      path = asset_file_path!(path)
      if path =~ /\.css$/
        content = File.read(path)
        content.each_line.collect do |line|
          line.gsub(/url\('?([^'\)]+)'?\)/) do |matched|
            url = matched.match(/url\('?([^'\)]+)'?\)/)[1]
            inline_css_url(path, url)
          end
        end.join("")
      else
        content = File.read(path)
      end      
    end.join("\n\n")
  end
  
  def inline_css_url(current_path, url)
    begin
      joined_url = File.join(File.dirname(current_path), url).to_s
      extension = joined_url.match(/\.([^.]+)$/)[1].downcase

      type = Mime::Type.lookup_by_extension(extension)
      file = File.read(joined_url)
      data_b64 = Base64.encode64(file)
      "url(\"data:#{type};base64,#{data_b64}\")"
    rescue
      "url(\"#{url}\")"
    end
  end
end 