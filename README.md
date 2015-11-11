# chf-go

chf-go a lightweight ruby web framework and PostgreSQL ORM with Rack
integration. It is primarily comprised of a base Model, a base Controller, and a
Router. Static assets should be served by default from the `public/` directory,
but this can be changed by modifying the `Rack::Static` configuration in
`config.ru`.

## Controller

Controllers inherit from `ControllerBase`, and provide logic for rendering and
redirecting. chf-go controllers can render HTML pages by calling `render` with a
template name, and render JSON by specifying the data in a hash format, i,e. {
json: @users }.

## Model

Models inherit from `ModelBase`. Queries to the database can use `all`, `find`, or
`where`, with `where` being chainable and able to accept both key-value pairs
and SQL strings. Where queries are concatenated on calling `fire_query`. 

```
query_string = params.keys.map do |param|
  param.is_a?(Symbol) ? param.to_s + ' = ?' : param
end.join(" AND ")
query_values = params.values.flatten
```

Models can be associated with other models, which define association instance
methods for easy querying of related records. `belongs_to`, `has_many`, and
`has_one_through` are avaialble as class methods on `ModelBase`.

## Router

The Router attempts to match the HTTP request to a drawn route and then
instantiates the appropriate controller and invokes the action specified in the
routes file. Routes are drawn in config/routes.rb.

When routes are drawn for REST routes under specified action names (`index`,
`create`, `new`, `edit`, `show`, `update`, and `destroy`), path helper methods
are automatically defined to return the relative path for that resource and
action. These are available in the controller.

```
module RouteHelper
  def self.create_helper(action_name, class_name)
    case action_name
    when :index, :create
      define_method("#{class_name}_path") do
        "/#{class_name}"
      end
    when :new
      define_method("new_#{class_name.chop}_path") do
        "/#{class_name}/new"
      end
    # ...
```
