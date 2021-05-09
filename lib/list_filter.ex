defmodule ListFilter do
  def call_list([_head | _tail] = list) do
    list
    |> parse_element()
    |> odd_count()
  end

  defp parse_element(elem) do
    elem
    |> Enum.flat_map(fn elem ->
      case Integer.parse(elem) do
        # transformando em inteiro
        {int, _rest} -> [int]
        # skip the value
        :error -> []
      end
    end)
  end

  defp odd_count(elem) do
    elem
    |> Enum.filter(fn odd -> rem(odd, 2) != 0 end)
    |> Enum.count()
  end
end
