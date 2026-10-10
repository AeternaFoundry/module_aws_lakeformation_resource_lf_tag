variable "lakeformation_resource_lf_tags" {
  description = <<EOT
Map of lakeformation_resource_lf_tags, attributes below
Optional:
    - catalog_id
    - region
    - database (block):
        - catalog_id (optional)
        - name (required)
    - lf_tag (block):
        - catalog_id (optional)
        - key (required)
        - value (required)
    - table (block):
        - catalog_id (optional)
        - database_name (required)
        - name (optional)
        - wildcard (optional)
    - table_with_columns (block):
        - catalog_id (optional)
        - column_names (optional)
        - column_wildcard (optional, block):
            - excluded_column_names (optional)
        - database_name (required)
        - name (required)
EOT

  type = map(object({
    catalog_id = optional(string)
    region     = optional(string)
    database = optional(list(object({
      catalog_id = optional(string)
      name       = string
    })))
    lf_tag = optional(list(object({
      catalog_id = optional(string)
      key        = string
      value      = string
    })))
    table = optional(list(object({
      catalog_id    = optional(string)
      database_name = string
      name          = optional(string)
      wildcard      = optional(bool)
    })))
    table_with_columns = optional(list(object({
      catalog_id   = optional(string)
      column_names = optional(set(string))
      column_wildcard = optional(list(object({
        excluded_column_names = optional(set(string))
      })))
      database_name = string
      name          = string
    })))
  }))
}

