
module Jekyll

    class LinkRefTag < Liquid::Tag
      def initialize(tag_name, text, tokens)
        @text = text
        super
      end
  
      def render(context)
        reg = context.registers
        site = reg[:site]
        resources = site.data["resources"]
        
        title = "default"
        url = "default"
        attrib = Array.new

        ls = @text.split(" ")
        uid = ls.shift
        
        # The hash is a set of sections
        # Within is a "resources" key with a list of items.
        resources.each do | k, v |
          items = resources[k]["resources"]
          items.each do | i |
            # puts i
            # puts "author" + i["author"].strip.downcase
            if (
                (i.key?("uid") and i["uid"].strip.eql?(uid.strip)) \
                or \
                (i.key?("author") and i["author"].strip.downcase.match(uid.strip))
              )
                title = i["title"]
                url = i["url"]

                if ls.include?("attribution")
                  attrib.push(i["author"])
                end

                if ls.include?("duration")
                  attrib.push(i['duration'])
                end

            end
          end
        end
        
        result = "<a href='#{url}'>#{title}</a>"

        if !attrib.empty?
          attributions = attrib.join(", ")
          result = "#{result} (#{attributions})"
        end

        return result
      end
    end
  end
  
  Liquid::Template.register_tag("link", Jekyll::LinkRefTag)
