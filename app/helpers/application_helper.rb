module ApplicationHelper
  def logo(image_path, size)
    if size == "large"
      actual_size = "1075×335"
    elsif size == "medium"
      actual_size = "600×205"
    else
      actual_size = "50x50"
    end
    image_tag image_path, size: "#{actual_size}"
  end
end
