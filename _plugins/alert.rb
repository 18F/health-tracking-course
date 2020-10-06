
module Jekyll
    class GuideBlock < Liquid::Block
      def initialize(tag_name, markup, tokens)
        @markup = markup
        super
      end
  
      def render(context)
        contents = super
  
        # pipe param through liquid to make additional replacements possible
        content = Liquid::Template.parse(contents).render context
  
        #strip out special chars and replace spaces with hyphens
        # safeContent = content.rstrip.gsub(/[^\w\s]/,'').gsub(/[\s]/,'-')
        mkup = "#{@markup}".split(" ")
        output = "<div class=\"usa-alert usa-alert--#{mkup[0]}\"><div class=\"usa-alert__body\">"
        output += "<h3 class=\"usa-alert__heading\">"
        mkup.shift()
        output += mkup.join(" ")
        output += "</h3>"
        output += "<p class=\"usa-alert__text\">"
        output += content.strip
        output += "</p></div></div>"
        
        output
      end
    end
  end
  
  Liquid::Template.register_tag("alert", Jekyll::GuideBlock)
