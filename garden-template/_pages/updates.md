---
layout: page
title: Обновления за месяц
id: upd
permalink: /updates
---

<h1 class="custom-h">Обновления по месяцам</h1>

{%- comment -%}
{% capture now %}{{'now' | date: '%s' | plus: 0 %}}{% endcapture %}
{% for note in site.notes %}
  {% capture date %}{{note.date | date: '%s' | plus: 0 %}}{% endcapture %}
  {% if date > now %}
    <!-- post content here -->
  {% endif %}
{% endfor %}
{%- endcomment -%}

{% assign sorted_notes = site.notes | sort: "date" | reverse %}

{% assign dates = '' | split: '' %}

{% for note in sorted_notes  %}
    {% if note.tag contains "verbum" or note.tag contains "personality" or note.tag contains "ex" %}
        {% continue %}
    {% else %}
        {% assign currentdate = note.date | date: "%m/%Y" %}
        {% assign dates = dates | push: currentdate %}
    {% endif %}
{% endfor %}

{% assign alldates = dates | uniq %}

{% for d in alldates %}
<h2>{{d}}</h2>
<div>

    {% assign mnotes = '' | split: '' %}

    {% for inote in sorted_notes %}
        {% assign currentdate = inote.date | date: "%m/%Y" %}
        {% if inote.tag contains "verbum" or inote.tag contains "personality" or inote.tag contains "ex" or currentdate != d %}
        {% else %}
            {% assign mnotes = mnotes | push: inote %}
        {% endif %}
    {% endfor %}

    {% assign tags = mnotes | sort: 'tag' | map: 'tag' | uniq %}

    {% assign sorted_tags = site.tagpages | sort: 'priority' %}
    {% assign matched_tags = '' | split: '' %}
  
    {% for tag in sorted_tags %}
      {% for backlink-tag in tags%}
        {% if backlink-tag contains tag.slug and tag.slug != "signum" %}
          {% assign matched_tags = matched_tags | push: tag.slug %}
        {% endif %}
      {% endfor %}
    {% endfor %}

    
        {% for tag in matched_tags %}
          {% for sitetag in site.tagpages %}
            {% if tag contains sitetag.slug %}
              
                <h3><a class="internal-link" href="tagpage/{{tag}}">{{ sitetag.titles }}</a></h3>
              
              {% break %}
            {% endif %}
          {% endfor %}
    
          {%- comment -%}
          <a class="internal-link" href="tagpage/{{tag}}">#{{tag}}</a>
          {%- endcomment -%}
    
          {% assign sorted_backlinks = mnotes | sort: 'date' | uniq %}
          <ul>
            {% for backlink in sorted_backlinks %}
              {% if backlink.tag contains tag %}
                <li>
                  <a class="internal-link" href="{{ backlink.url }}">{{ backlink.title }}</a>
                </li>
              {% endif %}
            {% endfor %}
          </ul>
        {% endfor %}
    

</div>    
{% endfor %}