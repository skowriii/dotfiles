local notify = require("mini.notify")

notify.setup()

vim.notify = notify.make_notify({
	DEBUG = { duration = 1000 },
	ERROR = { duration = 5000 },
	INFO  = { duration = 3000 },
	TRACE = { duration = 1000 },
	WARN  = { duration = 4000 },
	OFF   = { duration = 1000 }
})
