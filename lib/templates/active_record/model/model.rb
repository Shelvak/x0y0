class <%= class_name %> < ApplicationRecord
  has_paper_trail
<% if attributes.any?(&:has_uniq_index?) -%>
  <% uniqueness_attrs = [] -%>
  <% attributes.map { |a| uniqueness_attrs << ":#{a.name}" if a.has_uniq_index? } %>
  validates <%= uniqueness_attrs.join(', ') %>, uniqueness: true
<%- end -%>
end
