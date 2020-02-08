module Control.Joint.Effects.Filesystem where

import "base" Control.Exception (IOException, try)
import "joint" Control.Joint.Abilities (Liftable (lift))
import "joint" Control.Joint.Effects (Failable)

type Filesystem t = (Liftable IO t, Failable IOException t)

filesystem :: (Monad t, Filesystem t) => IO a -> t a
filesystem x = lift (try @IOException x) >>= lift
