{% macro convert_datatype(column_name, type) %}
    cast({{column_name}} as {{type}})
{% endmacro%}  