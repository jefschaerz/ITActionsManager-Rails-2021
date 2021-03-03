class Intervention < ApplicationRecord

  # ActiveRecord association declarations
  belongs_to :device
  belongs_to :intervention_type
  belongs_to :user
  belongs_to :intervention_state
  
  # Search by the param in the query
  scope :search, ->(query) {where('details like ?', "%#{query}%") }
  scope :search_by_device, ->(query) {where('device_id like ?', "%#{query}%") }
  scope :search_by_status, ->(query) {where('intervention_state_id like ?', "%#{query}%") }
  scope :search_by_intervention_type, ->(query) {where('intervention_type_id like ?', "%#{query}%") }
  scope :search_by_user, ->(query) {where('user_id like ?', "%#{query}%") }
  
  scope :search_query, ->(query) {
  puts "*** In search_query..."
  # Searches in intervention table in the 'summary' and 'details' columns.
  # Matches using LIKE, automatically prefixes and appends '%' to each term.
  # LIKE is case INsensitive with MySQL, however it is case
  # sensitive with PostGreSQL. To make it work in both worlds,
  # we downcase everything.
  return nil  if query.blank?

  # condition query, parse into individual keywords
  terms = query.downcase.split(/\s+/)

  # add both'%', remove duplicate '%'s
  terms = terms.map { |e|
    ("%" +e.tr("*", "%") + "%").gsub(/%+/, "%")
  }
  # configure number of OR conditions for provision
  # of interpolation arguments. Adjust this if you
  # change the number of OR conditions.
  num_or_conds = 2
  where(
    terms.map { |_term|
      "(LOWER(summary) LIKE ? OR LOWER(details) LIKE ?)"
    }.join(" AND "),
    *terms.map { |e| [e] * num_or_conds }.flatten,
  )
}

## General sorted_by scope function
scope :sorted_by, ->(sort_option) {
  # extract the sort direction from the param value.
  puts "***In sorted_by... with #{sort_option}"
  direction = /desc$/.match?(sort_option) ? "desc" : "asc"
  case sort_option.to_s
  when /^created_at_/
    order("interventions.created_at #{direction}")
  when /^intervention_type/
    # Make sure to include the table name to avoid ambiguous column names.
   order("LOWER(interventions.intervention_type_id) #{direction}").includes(:intervention_type).references(:intervention_type)
  when /^device/
    # Simple sort on the name colums
    order("LOWER(interventions.device_id) #{direction}, LOWER(interventions.device_id) #{direction}")
  when /^intervention_state/
    # This sorts by a Status 
    order("LOWER(interventions.intervention_state_id) #{direction}").includes(:intervention_state).references(:intervention_state)
    when /^user/
    # This sorts by a user 
    order("LOWER(interventions.user_id) #{direction}").includes(:user).references(:user)
  else
    raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
  end
}

end
