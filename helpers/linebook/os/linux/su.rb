Switches to a different user for the duration of a block.
(user='root', &block)
--
  target_name = guess_target_name(user)
  path = capture_path(target_name, 0700, &block)
  execute 'su', user, path, :m => true
  