defmodule KeywordLists do
  use Koans

  koan "Like maps, keyword lists are key-value pairs" do
    kw_list = [foo: "bar"]

    assert kw_list[:foo] == ___
  end

  koan "Keys may be repeated, but only the first is accessed" do
    kw_list = [foo: "bar", foo: "baz"]

    assert kw_list[:foo] == ___
  end

  koan "You could access a second key by removing the first" do
    kw_list = [foo: "bar", foo: "baz"]
    [_|kw_list] = kw_list

    assert kw_list[:foo] == ___
  end

  koan "Keyword lists just special syntax for lists of two-element tuples" do
    assert [foo: "bar"] == [{___, ___}]
  end

  koan "But unlike maps, the keys in keyword lists must be atoms" do
    not_kw_list = [{"foo", "bar"}]

    assert_raise ArgumentError, fn -> not_kw_list[___] end
  end

  koan "Conveniently keyword lists can be used for function options" do
    transform = fn str, opts ->
      if opts[:upcase], do: String.upcase(str)
    end

    assert transform.("good", upcase: true) == ___
  end

  def foo(kw_list), do: kw_list

  koan "Actually function bodies are a sneaky use of keyword lists" do
    list = foo do
      :good
    end

    assert list == [do: ___]
  end

  def iff(kw_list), do: kw_list

  koan "Turns out our beloved if statements are also using keyword lists" do
    list = iff do
      :this
    else
      :that
    end

    assert list == [do: ___, else: ___]
  end
end
