# -*- coding: utf-8 -*-
module Lokka
  module Helpers
    def read_more(body, link)
      if more = body.index("[More]")
        body = body[0..(more - 1)]
        body << %Q|<p class="read-more"><a href="#{link}">続きを読む</a></p>|
      end
      return body
    end

    def rm_read_more(body)
      body.index("[More]") ? body.gsub!(/\[More\]/, "") : body
    end
  end
end

