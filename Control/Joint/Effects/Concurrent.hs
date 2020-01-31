module Control.Joint.Effects.Concurrent where

import "async" Control.Concurrent.Async (Concurrently)
import "joint" Control.Joint.Abilities (Liftable)

type Concurrent = Liftable Concurrently
