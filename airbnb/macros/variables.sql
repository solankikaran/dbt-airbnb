{% macro learn_variables() %}

{% set my_name = "Karan" %}
{{ log("Hello " ~ my_name, info=True) }}
{{ log("Hello " ~ var("user_name")) }}

{% endmacro %}