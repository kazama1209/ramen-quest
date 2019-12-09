module ApplicationHelper
  def default_meta_tags
    {
      title: Settings.default_meta_tags.title,
      charset: Settings.default_meta_tags.charset,
      description: Settings.default_meta_tags.description,
      keywords: Settings.default_meta_tags.keywords,
      reverse: Settings.default_meta_tags.reverse,
      og: {
        title: Settings.default_meta_tags.og.title,
        description: Settings.default_meta_tags.og.description,
        type: Settings.default_meta_tags.og.type,
        locale: Settings.default_meta_tags.og.locale,
        image: image_url('ogp.png')
      }
    }
  end
end
