local notification = {}

notification.levels = vim.deepcopy(vim.log.levels)

notification.send = function(msg, lvl, opts)
  local async_loaded, async = pcall(require, "plenary.async")
  local notify_loaded, notify = pcall(require, "notify")

  if not notify_loaded then
    return vim.notify(msg, lvl, opts)
  end

  if not async_loaded then
    return notify(msg, lvl, opts)
  end

  async.run(function()
    notify.async(msg, lvl, opts)
  end)
end

notification.trace = function(msg, opts)
  notification.send(msg, notification.levels.TRACE, opts)
end

notification.debug = function(msg, opts)
  notification.send(msg, notification.levels.DEBUG, opts)
end

notification.info = function(msg, opts)
  notification.send(msg, notification.levels.INFO, opts)
end

notification.warn = function(msg, opts)
  notification.send(msg, notification.levels.WARN, opts)
end

notification.error = function(msg, opts)
  notification.send(msg, notification.levels.ERROR, opts)
end

return notification
