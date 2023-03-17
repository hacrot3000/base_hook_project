import posix, logging, sim
import enums, stdstr
export enums, stdstr

import ../../shared/shared_types

type

  VectorImpl*[T] = object
    M_start*: ptr T
    M_finish*: ptr T
    M_end_of_storage*: ptr T

  VectorObj*[T] = object
    M_impl*: VectorImpl[T]

  Vector*[T] = ptr VectorObj[T]

  FDEventHandler*  = object
    vptr: pointer
    m_id*: int32
    m_fd*: int32
    gap16: array[16, uint8]

  Rb_tree_color* {.size: 4.} = enum
    S_red = 0
    S_black = 1

  Rb_tree_node_base* = object
    M_color*: Rb_tree_color
    M_parent*: ptr Rb_tree_node_base
    M_left*: ptr Rb_tree_node_base
    M_right*: ptr Rb_tree_node_base

  #stdMap* = object
  #  m: array[0x30, byte]

  Rb_tree_impl* = object
    M_key_compare*: byte
    pad: array[7, byte]
    M_header*: Rb_tree_node_base
    M_node_count*: int32

  Rb_tree*[A, B] = object
    M_impl* : Rb_tree_impl

  MapObj*[A, B] = object
    M_t*: Rb_tree[A, B]

  Map*[A, B] = ptr MapObj[A, B]
  stdMap* = MapObj[void, void]

  List_node_base* = object
    M_next*: ptr List_node_base
    M_prev*: ptr List_node_base

  List_impl* = object
    M_node*: List_node_base

  List*[T] = object
    M_impl*: List_impl

  stdList* = List[void]

