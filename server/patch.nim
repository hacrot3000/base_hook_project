from posix import Tm
import funchook, random, times, strformat, httpclient, os, strutils
import private/[common, dispatcher, types, utils, vector, stdstr]
import shared_types
import ba0f3/[fptr, logger]

import modules/[potential]

randomize()

proc NI_asyncExecuteRequest*(this: CConnection, data: CByteArray) : void =
  debug "Got asyncExecuteRequest"

  this.asyncExecuteRequest(data)

echo "Initializing patches.."
# prevent this library loaded into external processes
delEnv("LD_PRELOAD")
#register(SIGHUP, sighup_callback)
var
  fh = initHook()
  rv: FUNCHOOK_ERROR

setDebugFile("/home/pirate/battle/log/fun_hook.log")

#Setup a hook
fh.prepare(faddr asyncExecuteRequest, NI_asyncExecuteRequest)


#rv = fh.prepare(faddr dispatchMessage, NI_dispatchMessage)

if rv != SUCCESS:
 error "Hook GameMessageDispatcher::dispatchMessage", msg=fh.errorMessage()


when not defined(release):
  warn "!!!Running on DEVELOPVEMENT mode!!!"

ee.emit(PREPARE_HOOK, HookArgs(fh: fh))

rv = fh.install()
if rv != SUCCESS:
  error "Hook install", msg=fh.errorMessage()  

echo "Patches installed"

gInit()
