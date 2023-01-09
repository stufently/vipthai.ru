---
layout: faq
---
{% include faq.scheme.md %}

{%- for group in site.data.faq_groups -%} {%- assign group_path = '/' | append: group.path | downcase | append: '/' -%}

- [{{ group.title }}](#{{ group.hashtag }})
  {%- for item in site.faq %} {% if item.path contains group_path %}
    - [{{ item.question }}](#{{ item.hashtag }}){% endif %} {% endfor %}

{% endfor %}

{% for group in site.data.faq_groups %}

{% assign group_path = '/' | append: group.path | downcase | append: '/' %}

# {{ group.title }} {#{{group.hashtag}}}

{% for item in site.faq %} {% if item.path contains group_path %}

## {{ item.question }} {#{{item.hashtag}}}

{{ item.output }} {% endif %} {% endfor %} {% endfor %}