module Control.Joint.Effects.Concurrent where

import "async" Control.Concurrent.Async (Concurrently, runConcurrently)
import "joint" Control.Joint.Abilities (Composition (Primary, run), Adaptable (adapt), Liftable)

instance Composition Concurrently where
	type Primary Concurrently a = IO a
	run = runConcurrently

instance Adaptable STM IO where
	adapt = atomically

type Concurrent = Liftable Concurrently
