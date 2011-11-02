# -*- coding: utf-8 -*-
module Lokka
  module Helpers
    def press_bread_crumb
      return if @bread_crumbs.size == 1
      @bread_crumbs[0..-2].inject('<ol>') do |html,bread|
        html += "<li><a href=\"#{bread[:link]}\">#{bread[:name]}</a></li>"
      end + "<li>#{@bread_crumbs[-1][:name]}</li></ol>"
    end

    def press_read_more(body, link)
      if more = body.index("[More]")
        body = body[0..(more - 1)]
        body << %Q|<p class="read-more"><a href="#{link}">続きを読む</a></p>|
      end
      return body
    end

    def press_remove_more(body)
      body.index("[More]") ? body.sub!(/\[More\]/, "") : body
    end

    def press_pager(entry, option = {})
      prev_entry, next_entry = Entry(entry.id - 1), Entry(entry.id + 1)
      html =  "<nav class=#{option[:class]}>"
      html <<   "<ul>"
      html <<     "<li class='next'>"
      html <<       "<a class='next-link' href=#{next_entry.link}>#{next_entry.title}</a>" if next_entry
      html <<     "</li>"
      html <<     "<li class='previous'>"
      html <<       "<a class='previous-link' href=#{prev_entry.link}>#{prev_entry.title}</a>" if prev_entry
      html <<     "</li>"
      html <<   "</ul>"
      html << "</nav>"
      html.html_safe
    end
  end
end

