(module
  (memory $imports.memory (;0;) (import "imports" "memory") 100 1500)
  (func $loop (;0;) (export "loop")
    (local $loop_index i32)
    (local $prev i64)
    (local.set $loop_index (i32.const 0))
    (local.set $prev (i64.const 0))
    (loop
      (i64.load (local.get $loop_index))
      (i64.store (local.get $loop_index) (local.get $prev))
      (local.set $prev)
      (local.set $loop_index (i32.add (local.get $loop_index) (i32.const 8)))
      (br_if 1 (i32.gt_u (local.get $loop_index) (memory.size)))
      (br 0)
    )
  )
)