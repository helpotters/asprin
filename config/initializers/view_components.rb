#!/usr/bin/env ruby
Rails.application.config.view_component.generate.stimulus_controller = true
Rails.application.config.view_component.generate.sidecar = true
Rails.application.config.view_component.preview_paths << "#{Rails.root}/spec/previews"

# # Lookbook
# Rails.application.config.lookbook.preview_paths = ["spec/previews"]
# Rails.application.config.lookbook.preview_layout = "component_preview"
