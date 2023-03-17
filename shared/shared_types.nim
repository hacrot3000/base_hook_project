import json, streams
import times

template be*() {.pragma.}
template msgid*(id: auto) {.pragma.}

type
  CConnection* = ptr object
  CByteArray* = ptr object
  CBtLogger* = ptr object
  
  # ServerInfo* = object
  #   nLastClearDataTime*: DateTime # lc
  #   nLastRewaredTime*: DateTime # lr
  #   nLastExamClearDataTime*: DateTime # lec
  #   nLastExamRewardedTime*: DateTime # ler

  # ArenaUserInfo* = ref object of RootObj
  #   lUserId*: UserId
  #   nServerId*: uint16
  #   sServerName*: string
  #   sUserName*: string
  #   nHeroId*: int32
  #   nLevel*: int32

  # ArenaInfo* = ref object of RootObj
  #   lUserId*: UserId
  #   nLastRankChange*: int64
  #   nContinuousWin*: uint16
  #   nRewardedMilestone*: uint16
  #   nHighestRank*: uint32

  # MODULE* = enum
  #   GLOBAL_ARENA
  #   EXAM
  #   DUNG_LUYEN

  # UserId* = distinct uint64
  # HeroId* = distinct int32
  # ItemCode* = distinct uint64
  # ItemId* = distinct uint32

  # ITEM_TYPE* {.size: 2.} = enum
  #   ITEM_TYPE_MONEY
  #   ITEM_TYPE_ITEM
  #   ITEM_TYPE_EXP
  #   ITEM_TYPE_ORDER
  #   ITEM_TYPE_HERO
  #   ITEM_TYPE_PRESTIGE
  #   ITEM_TYPE_SOUL
  #   ITEM_TYPE_COLOR_SOUL
  #   ITEM_TYPE_TITLE = 12
  #   ITEM_TYPE_MASTERSTAR_SOUL
  #   ITEM_TYPE_WORLDBATTLE_TOKEN
  #   ITEM_TYPE_OCCULTEFFECT_POINT
  #   ITEM_TYPE_PVP_POINT
  #   ITEM_TYPE_REINCARNATON_SCORE
  #   ITEM_TYPE_TABOOSKILL_ITEM = 18
  #   ITEM_TYPE_AWAKEN_ITEM = 20
  #   ITEM_TYPE_EIGHTINNERGATES_STONE
  #   ITEM_TYPE_WORLDTREE_TICKET
  #   ITEM_TYPE_EXPPOWER = 23
  #   ITEM_TYPE_CHALLENGE_HURT = 24
  #   ITEM_TYPE_AWAKEN_SOUL = 25
  #   ITEM_TYPE_GLOBAL_ARENA_SHOP_POINT = 26
  #   ITEM_TYPE_GLOBAL_ARENA_RANK_POINT = 27

  

# proc `$`*(u: UserId): string {.borrow.}
# proc `%`*(u: UserId): JsonNode {.borrow.}
# proc `==`*(a, b: UserId): bool {.borrow.}

# proc `$`*(u: HeroId): string {.borrow.}
# proc `%`*(u: HeroId): JsonNode {.borrow.}
# proc `==`*(a, b: HeroId): bool {.borrow.}

# proc `$`*(u: ItemId): string {.borrow.}
# proc `%`*(u: ItemId): JsonNode {.borrow.}
# proc `==`*(a, b: ItemId): bool {.borrow.}

# proc `$`*(u: ItemCode): string {.borrow.}
# proc `%`*(u: ItemCode): JsonNode {.borrow.}
# proc `==`*(a, b: ItemCode): bool {.borrow.}