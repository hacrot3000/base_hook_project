import ba0f3/fptr, types, shared_types


type
  ListIterator*[T] = object
    M_node*: ptr List_node_base

# int32
#proc begin*(this: List[int32]): ListIterator[int32] {.fptr, cdecl.} = 0x1914FF0
#proc endd*(this: List[int32]): ListIterator[int32] {.fptr, cdecl.} = 0x1915018
proc push_back*(this: List[int32], x: int32) {.fptr, cdecl.} = 0x19148C4

# UserFighter
#proc begin*(this: var List[UserFighter]): ListIterator[UserFighter] {.fptr, cdecl.} = 0x1915B8C
#proc endd*(this: var List[UserFighter]): ListIterator[UserFighter] {.fptr, cdecl.} = 0x1915BB4
proc erase*(this: var List[UserFighter], x: ListIterator[UserFighter]): ListIterator[UserFighter] {.fptr, fastcall.} = 0x1915C12
proc clear*(this: var List[UserFighter]) {.fptr, fastcall.} = 0x19151CA

#proc `[]`*(it: var ListIterator[UserFighter]): ptr UserFighter {.fptr, fastcall.} = 0x1915BFC

# common
proc copyIt[T](this: var ListIterator[T], x: ptr List_node_base) = this.M_node = x

proc first*[T](this: var List[T]): ListIterator[T] = copyIt(result, this.M_impl.M_node.M_next)
proc last*[T](this: var List[T]): ListIterator[T] = copyIt(result, addr this.M_impl.M_node)

proc empty*[T](this: var List[T]): bool = this.M_impl.M_node.M_next == cast[ptr List_node_base](addr this)

proc front*[T](this: var List[T]): ptr T = this.first.get()

proc `==`*[T](this: var ListIterator[T], x: ListIterator[T]): bool = this.M_node == x.M_node

proc `!=`*[T](this: var ListIterator[T], x: ListIterator[T]): bool = this.M_node != x.M_node

proc `++`*[T](this: var ListIterator[T]): ListIterator[T] {.discardable.} =
  result.M_node = this.M_node
  copyIt(this,  this.M_node.M_next)

proc get*[T](it: var ListIterator[T]): ptr T = cast[ptr T](cast[int](it.M_node) + 0x10)

