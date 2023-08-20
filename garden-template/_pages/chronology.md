---
layout: page
title: Хронология
id: timeline
permalink: /timeline
---


<h1 class="custom-h">Хронология</h1>

{% assign sorted_notes = site.notes | sort: "date" | reverse %}

{% assign dates = '' | split: '' %}

{% for note in sorted_notes  %}
    {% if note.tag contains "verbum" or note.tag contains "personality" or note.tag contains "ex" or note.tag contains "essentia" or note.tag contains "hmanalysis" or note.tag contains "hmcycles" or note.tag contains "hmglossary" or note.tag contains "hmphilosophy" %}
        {% continue %}
    {% else %}
        {% assign currentdate = note.date | date: "%d/%m/%Y" %}
        {% assign dates = dates | push: currentdate %}
    {% endif %}
{% endfor %}

{% assign alldates = dates | uniq %}

{% for d in alldates %}
<p><span class="taglink">{{d}}</span>
<br>
    {% for inote in sorted_notes %}
        {% assign currentdate = inote.date | date: "%d/%m/%Y" %}
        {% if inote.tag contains "verbum" or inote.tag contains "personality" or inote.tag contains "ex" or currentdate != d %}
        {% else %}

            {% assign variable = inote.tag %} 
            {% for item in site.tagpages %}
                {% if inote.tags[0] contains item.slug %}
                    {% assign variable = item %}
                    {% break %}
                {% endif %}
            {% endfor %}

        <a class="internal-link" href="{{inote.url}}">{{inote.title}}</a>&nbsp;<a class="taglink" href="tagpage/{{variable.slug}}">#{{variable.title | downcase}}</a><br>
        {% endif %}
    {% endfor %}
</p>   
{% endfor %}