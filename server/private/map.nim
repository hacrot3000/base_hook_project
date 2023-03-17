import ba0f3/fptr, types, shared_types

type
  Pair*[A, B] = object
    first*: A
    second*: B

  Iterator*[A, B] = object
    M_node*: pointer


# stdMap<ItemCode, Item>
proc init(this: Map[ItemCode, Item]) {.fptr, fastcall.} = 0x17B302A

proc begin*(this: Map[ItemCode, Item]): Iterator[ItemCode, Item] {.fptr, fastcall.} = 0x1704BC6
proc endd*(this: Map[ItemCode, Item]): Iterator[ItemCode, Item] {.fptr, fastcall.} = 0x1704BE0

proc `[]`*(this: Map[ItemCode, Item], itemCode: ItemCode): ptr Item {.fptr, fastcall.} = 0x24CF51C
proc size*(this: Map[ItemCode, Item]): int32 {.fptr, fastcall.} = 0x17B305E

proc next*(this: ptr Iterator[ItemCode, Item]) {.fptr, fastcall.} = 0x170617A
proc pair*(this: ptr Iterator[ItemCode, Item]): ptr Pair[ItemCode, Item] {.fptr, fastcall.} = 0x17061A2

# stdMap<int32, int32>
proc init(this: Map[int32, int32]) {.fptr, fastcall.} = 0x16461FE
proc `~`*(this: Map[int32, int32]) {.fptr, fastcall.} = 0x1645052
proc `[]`*(this: Map[int32, int32], k: ptr int32): ptr int32 {.fptr, fastcall.} = 0x1646116
proc size*(this: Map[int32, int32]): int32 {.fptr, fastcall.} = 0x17146D4
proc find*(this: ptr MapObj[int32, int32], x: ptr int32): Iterator[int32, int32] {.fptr, fastcall.} = 0x1663A98
#proc insert(this: Map[int32, int32], k: int32,): int32 {.fptr, fastcall.} = 0x1648E10
proc begin*(this: Map[int32, int32]): Iterator[int32, int32] {.fptr, fastcall.} = 0x1645F90
proc endd*(this: Map[int32, int32]): Iterator[int32, int32] {.fptr, fastcall.} = 0x1645FAA

proc next*(this: ptr Iterator[int32, int32]) {.fptr, fastcall.} = 0x17061B8
proc pair*(this: ptr Iterator[int32, int32]): ptr Pair[int32, int32] {.fptr, fastcall.} = 0x1645FE6

# common

proc `==`*(this: ptr Iterator[int32, int32], x: ptr Iterator[int32, int32]): bool = this.M_node == x.M_node

proc initMap*[A, B](): Map[A, B] =
   result = cast[Map[A, B]](alloc0(0x30))
   init(result)
