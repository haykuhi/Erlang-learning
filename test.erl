-module(test).
-export([mult/2,square/1,square_list/1,log_list/1,pattern_matching/0]).

mult(A,B) ->
  A*B.

square(A) ->
  A*A.

square_list(List) ->                                   %%Funktion
  SquareFun = fun(Element) -> square(Element) end,     %%fun
  lists:map(SquareFun,List).                           %%nehme Liste und führe SquareFun für jedes Element aus und erstelle somit neue Liste

log_list(List) ->
  LogFun = fun (Element) -> io:format("Element:~p~n", [Element]) end,    %%p für zahlen, listen buchstaben; io format ist funktion, um auf console auszugeben
  lists:foreach(LogFun,List).                                            %%bei map und foreach immer (Fun,List)

data_structures () ->
  Atom = haykuhi,   %% immer klein, sonst wie string und nicht trennbar
  Zahl = 2,
  Tupel = {hi,"Mirko",1}, %% wie Liste, nur nicht trennbar
  Listen = [1,"", hi],
  String = "".

pattern_matching() ->
  Haykuhi = {person, "Haykuhi", 22, "Heidelberg"},
  Mirko = {person, "Mirko", 23, "Finkenbach"},
  Johannes = {person, " Johannes", 30, "Heidelberg"},
  log(person_age(Mirko)),
  wohn_gegend(Johannes).
  

person_age(Person) ->
  {person, _Name, Age, _Location} = Person,       %%im Tupel befinden sich Variablen
  Age. 

wohn_gegend({person, _Name, _Age, "Finkenbach"}) ->        %% einzelne patterns mit ;
  "im Kaff";

wohn_gegend({person, _Name, _Age, "Heidelberg"}) ->
  "in der City";

wohn_gegend({person, _Name, _Age, Location}) ->
  "unbekannter Ort".

wohn_gegend_anders(Person) ->
  case Person of
    {person, _Name, _Age, "Finkenbach"} -> "im Kaff",
    {person, _Name, _Age, "Heidelberg"} -> "in der City",
    {person, _Name, _Age, _Location} -> "unbekannt"
  end.

wohn_gegend_noch_anders({person, _Name, _Age, Location}) ->
  case Location of
    "Finkenbach" -> "im Kaff",
    "Heidelberg" -> "in der City",
    Location -> "unbekannt"
  end
  
log(Element) ->
  io:format("Log:~p~n", [Element]).
