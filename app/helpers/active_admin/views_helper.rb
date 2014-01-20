module ActiveAdmin::ViewsHelper
  def exclude_unnecessary_fields(fields)
    return fields.reject{ |f|
        (f == 'id' || f.end_with?('file_name') || f.end_with?('file_size') || f.end_with?('updated_at') || f.end_with?('created_at'))
    }
  end
end
