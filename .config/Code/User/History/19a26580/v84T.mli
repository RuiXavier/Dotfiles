type 'a dblist 
(*@ mutable model view: 'a list*)

val create : unit -> 'a dblist
(*@ r = create ()
    ensures r.view = [] *)

val is_empty : 'a dblist -> bool
(*@ b = is_empty list
    ensures b <-> list.view = [] *)

val clear : 'a dblist -> unit
(*@ clear list
    modifies list
    ensures list.view = []*)

val get_head : 'a dblist -> 'a option
(*@ h = get_head list
    ensures match h with
            | None -> list.view = []
            | Some x -> list.view = x :: (old list.view) *)

val get_tail : 'a dblist -> 'a option
(* Como expressar que o retorno da função é o elemento final da lista? *)

val get_size : 'a dblist -> int
(*@ s = get_size list
    ensures s = List.length list.view *)

val insert_front : 'a dblist -> 'a -> unit
(*@ insert_front list data
    modifies list
    ensures list.view = data :: (old list.view)
    ensures List.length list.view = (old List.length list.view) + 1 *)

val insert_back : 'a dblist -> 'a -> unit
(*@ insert_back list data
    modifies list
    ensures list.view = (old list.view) ++ (data::[])
    ensures List.length list.view = (old List.length list.view) + 1 *)

val insert_before : 'a dblist -> 'a -> 'a -> unit
(*Como expressar que a nova data é inserida antes da antiga data 
esteja ela onde estiver na lista, inicio, meio ou fim.*)

val insert_after : 'a dblist -> 'a -> 'a -> unit
(*Como expressar que a nova data é inserida antes da antiga data 
esteja ela onde estiver na lista, inicio, meio ou fim.*)

val remove_head : 'a dblist -> 'a option
(*@ r = remove_head list
    modifies list
    ensures match r with
            | None -> (old list.view) = []
            | Some x -> (old list.view) = x::(list.view)
            ensures List.length list.view = (old List.length list.view) - 1 *)

val remove_tail : 'a dblist -> 'a option
(*@ r = remove_tail list
    modifies list
    ensures match r with
            | None -> (old list.view) = []
            | Some x -> (old list.view) = list.view ++ (x::[])
            ensures List.length list.view = (old List.length list.view) - 1 *)

val reverse : 'a dblist -> unit
(*@ reverse list
    modifies list
    ensures list.view = List.rev (old list.view) *)

val append : 'a dblist -> 'a dblist -> 'a dblist
(*@ r = append list1 list2
    ensures r.view = (old list1.view) ++ (old list2.view)
    ensures List.length r.view = (old List.length list1.view) + (old List.length list2.view) *)

val josephus : unit dblist -> int -> unit
(*Como especificar que sobra apenas um elemento para além de length = 1?*)
(*@ josephus list k
    modifies list
    requires k > 0
    ensures List.length list.view = 1 *)
