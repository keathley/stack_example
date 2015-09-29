defmodule Stack do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def push(pid, item) do
    GenServer.call(pid, {:push, item})
  end

  def pop(pid) do
    GenServer.call(pid, {:pop})
  end

  def peek(pid) do
    GenServer.call(pid, {:peek})
  end

  def init(stack \\ []) do
    {:ok, stack}
  end

  def handle_call({:push, item}, _from, stack) do
    new_stack = [item | stack]
    {:reply, new_stack, new_stack}
  end

  def handle_call({:pop}, _from, [head | tail] = _stack) do
    {:reply, head, tail}
  end

  def handle_call({:peek}, _from, stack) do
    {:reply, stack, stack}
  end
end

