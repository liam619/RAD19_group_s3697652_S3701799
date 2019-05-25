module ApplicationHelper
    def full_title(page_title = '')
        base_title = "Assignment1"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end

    # For nav tab, active the correct tab
    def is_active?(link_path)
        link_path.include?(request.path) ? "active" : ""
    end
end
