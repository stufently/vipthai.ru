{% assign faq_ld_items = site.faq | where:"ldjson", true %}

{%- if faq_ld_items | size -%}

{%- assign schema_items = faq_ld_items | faq_items | join: "," -%}

<script type="application/ld+json">{"@context":"https://schema.org","@type":"FAQPage","mainEntity": {{ schema_items }} }</script>

{%- endif -%}
