require 'thor/group'

class BricksDeploy::Generator < Thor::Group
  include Thor::Actions

  def self.source_root
    File.expand_path('../templates', __FILE__)
  end

  def copy_main_hook
    copy_hook 'after_push.sh', 'bin/deploy/remote/after_push'
  end

  def copy_restart_hook
    copy_hook 'restart.sh', 'bin/deploy/remote/restart'
  end

  def copy_restart_callbacks
    copy_hook 'before_restart.sh', 'bin/deploy/remote/before_restart'
    copy_hook 'after_restart.sh', 'bin/deploy/remote/after_restart'
    copy_hook 'setup.sh', 'bin/deploy/remote/setup'
  end

  private

  def copy_hook(template, destination)
    copy_file template, destination
    chmod destination, 0744 unless File.executable? destination
  end
end
