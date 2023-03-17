{.used.}

import funchook
import streams, std/net, times, with, tables, funchook, locks
import tables, sim, with, random
import private/[common, utils, types, dispatcher, vector]
import shared_types, shared_utils
import ba0f3/[fptr, logger]
import std/[times, os]
import std/strutils


proc NI_getItem*(key: int64, index: int64): int64 =   
  result = getItem(key, index)
  if key == 58062128:
    result = 14107165
    debug "PTT: getItem", key, result
  else:
    result = getItem(key, index)


ee.on(PREPARE_HOOK) do(a: Args):
  let args = HookArgs(a)

  # args.fh.prepare(faddr getSize, NI_getSize)
  args.fh.prepare(faddr getItem, NI_getItem)

