defmodule Todo.EventApplication do
 use Commanded.Application, otp_app: :todo

  router(Todo.EventRouter)
end
