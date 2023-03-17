import eventemitter, funchook, times
export on, once, emit, Args, FuncHook

import types, shared_types

type
  EVENT_KIND* = enum
    READY
    PREPARE_HOOK
    RELOAD_CONFIG
    ON_MINUTE_BEGIN
    ON_HOUR_BEGIN
    ON_DAY_BEGIN
    ON_MONTH_BEGIN
    ON_LOOP_FIRST
    ON_LOOP
    ON_SEND_CONFIG
    ON_INIT_ITEM_DB
    ON_CLOSE


type
  ReadyArgs* = ref object of Args
    #xmlPath*: string

  TimeArgs* = ref object of Args
    now*: DateTime

  HookArgs* = ref object of Args
    fh*: FuncHook


var ee* = createEventEmitter[EVENT_KIND]()