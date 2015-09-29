defmodule Stack do
  def init do
    []
  end

  def push(stack, item) do
    [item | stack]
  end

  def pop([first | rest] = _stack) do
    {first, rest}
  end
end

