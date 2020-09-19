defmodule Mongo.Db.Collection.Test do
  use ExUnit.Case, async: false

  test "drop database" do
    mongo = Mongo.connect!
    db = Mongo.db(mongo, "TEST_db")
    Mongo.Db.dropDatabase(db)

    anycoll = Mongo.Db.collection(db, "index_test")
    %{code: code} = Mongo.Collection.getIndexes(anycoll)
    assert code != 0

    [%{a: 1, b: 2}]
    |> Mongo.Collection.insert(anycoll)

    assert [_idx] = Mongo.Collection.getIndexes(anycoll)
  end
end
