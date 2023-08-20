# frozen_string_literal: false

=begin

class TagSearchGenerator < Jekyll::Generator
    def generate(site)

        all_tags = site.collections['tagpages'].docs

        all_tags.each do |current_tag|
        s = '---
layout: none
---

{% assign n = "" | split: "" %}

{% for note in site.notes %}
    {% if note.tags contains "TAGSLUG" %}
        {% assign n = n | push: note %}
    {% endif %}
{% endfor %}

[
{% for note in n %}
        {
        "title"    : "{{ note.title | escape }}",
        "content"  : {{ note.content | strip_html | strip_newline | strip | jsonify }}
        } {% unless forloop.last %},{% endunless %}
{% endfor %}
]'

            s.sub! 'TAGSLUG', current_tag.data['slug']

            f = 'assets/' + current_tag.data['slug'] + '.json'

            File.write(f, s)
        end
    end
end

=end