open OUnit

let main () = 
  let test_a _ = assert_equal 1 1 in
  run_test_tt ("test suite a" >::: ["test_a" >:: test_a])

let _ = main ()
