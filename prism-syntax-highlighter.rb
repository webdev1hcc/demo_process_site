class PrismSyntaxHighlighter < Asciidoctor::SyntaxHighlighter::Base
  register_for 'prism'

  def format node, lang, opts
    opts[:transform] = proc do |pre, code|
      code['class'] = %(language-#{lang}) if lang
      
      attributes = node.attributes
      if attributes.key?('linenums')
        pre['class'] += ' line-numbers'
      end
      
      if attributes.key?('data-line')
        pre['data-line'] = %(#{attributes['data-line']})
      end
      
      if attributes.key?('data-start')
        pre['data-start'] = %(#{attributes['data-start']})
      end
      
    end
    super
  end

  def docinfo? location
    location == :footer
  end

  def docinfo location, doc, opts
    base_url = doc.attr 'prismdir', %(#{opts[:cdn_base_url]}/prism/1.15.0)
    slash = opts[:self_closing_tag_slash]
    unless (theme_name = doc.attr 'prism-style', 'prism') == 'prism'
      theme_name = %(prism-#{theme_name})
    end
  end
end
