open OUnit

let main () = 
  let test_b _ = assert_equal 1 1 in
  run_test_tt ("test suite b" >::: ["test_b" >:: test_b])

let _ = main ()
