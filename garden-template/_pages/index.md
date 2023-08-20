---
layout: page
title: Начало
id: home
permalink: /
---

<h1 class="custom-h">Название сайта</h1>

<p>Описание сайта</p>

<p>
{% assign sorted_projects = site.projects | sort: 'priority' %}
{% for proj in sorted_projects %}

  <strong><a href = "/{{proj.slug}}" class="internal-link">{{proj.title}}</a></strong>:
        {% for taggroup in proj.intags %}
        {% assign current = 0 %}
        {% assign intags = taggroup | split: ',' %}
        {% assign count = intags.size %}
            {% for tag in intags %}
              {% for t in site.tagpages %}
                {% if t.slug contains tag %}
                {% assign current = current | plus: 1 %}
                  <a class="taglink" href="tagpage/{{t.slug}}">#{{t.titles | downcase}}</a>
                  {% break %}
                {% endif %}
              {% endfor %}
            {% endfor %}
          {% endfor %}
<br>

{% endfor %}

</p>



<div>
  <input type="search" id="search-input" placeholder="Начните вводить для поиска" aria-label="Search">
</div>

<ul id="search-results"></ul>

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




<h2>Последние обновления <a class = "internal-link" href = "timeline">→</a></h2>

{% assign sorted_notes = site.notes | sort: "date" | reverse  %}
{% assign count_notes = 0 %}
<ul>
      {% for note in sorted_notes  %}
        {% if note.tag contains "verbum" or note.tag contains "personality" or note.tag contains "ex" or note.tag contains "essentia" or note.tag contains "hmanalysis" or note.tag contains "hmcycles" or note.tag contains "hmglossary" or note.tag contains "hmphilosophy" or count_notes > 6 or note.date == nil %}

        {% else %}

            {% assign variable = note.tag %} 
            {% for item in site.tagpages %}
                {% if note.tags[0] contains item.slug %}
                    {% assign variable = item %}
                    {% break %}
                {% endif %}
            {% endfor %}

          <li><a class="internal-link" href="{{note.url}}">{{note.title}}</a>&nbsp;<a class="taglink" href="tagpage/{{variable.slug}}">#{{variable.title | downcase}}</a></li>
          {% assign count_notes = count_notes | plus: 1 %}
        {% endif %}
      {% endfor %}
</ul>



<h2 id="Contacts">Следить за обновлениями</h2>

  <p>
    Начало Умозрения: <a href="https://t.me/originlook">@originlook</a><br>
    Прагмалогия: <a href="https://t.me/pragmalogos">@pragmalogos</a><br>
  </p>
