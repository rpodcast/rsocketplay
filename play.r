library(httpuv)
library(sys)
library(processx)

s <- startServer(host = "0.0.0.0", port = 5779,
  app = list(
    call = function(req) {
      body <- paste0("Time: ", Sys.time(), "<br>Path requested: ", req$PATH_INFO)

      if (req$PATH_INFO == "/wchat") {
        sys::exec_wait(cmd = "bash", args = "scripts/welcome.sh")
      }

      list(
        status = 200L,
        headers = list("Content-Type" = "text/html"),
        body = body
      )
    }
  )
)

s$stop()
