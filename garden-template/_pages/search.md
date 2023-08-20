---
layout: page
title: Архив
id: search
permalink: /search
---

<h1 class="custom-h">Архив</h1>

<div>
  <input type="search" id="search-input" placeholder="Начните вводить для поиска" aria-label="Search">
</div>

<ul id="search-results"></ul>
<hr>

  <script src="/assets/simple-jekyll-search.min.js"></script>

  <script type="text/javascript">
    var sjs = SimpleJekyllSearch({
    searchInput: document.getElementById('search-input'),
    resultsContainer: document.getElementById('search-results'),
    json: '/assets/search.json',});
  </script>

<script type="text/javascript">
document.addEventListener('keydown', logKey);
function logKey(e) {
  var input = document.getElementById("search-input");
  if(input.value == ""){
    input.focus();
    //input.value = e.key;
  }
}
</script>

<div>

{% assign sorted_tags = site.tagpages | sort: 'priority'  %}

  {% for tag in sorted_tags %}

    {% unless tag.hideinsearch == true %}

    <h2><a class="internal-link" href = "tagpage/{{tag.slug}}">{{ tag.titles }}</a></h2>
    <ul>

    {% assign sorted_notes = site.notes | sort: 'priority'  %}
    {% assign count_notes = 0 %}
      {% for note in sorted_notes %}
        {% if note.tag contains tag.slug %}
          {% if count_notes < 9 %}
            <li><a class="internal-link" href="{{note.url}}">{{note.title}}</a></li>
            {% assign count_notes = count_notes | plus: 1 %}
          {% else %}
            <strong><a class="internal-link" href="tagpage/{{tag.slug}}">Посмотреть все</a></strong>
            {% break %}
          {% endif %}
        {% endif %}
      {% endfor %}
    </ul>

  {% endunless %}

  {% endfor %}
  </div>
