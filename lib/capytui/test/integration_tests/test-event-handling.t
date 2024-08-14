
This test showcases is a more realistic test suite
of capytui not swallowing/missing key events.

This test is a regression against a test where capytui
missed the very first key event.

  $ bin/test_integration_key_events.exe --help
  A debug executable for testing key events.
  
    test_integration_key_events.exe 
  
  === flags ===
  
    [-build-info]              . print info about this build and exit
    [-version]                 . print the version of this build and exit
    [-help], -?                . print this help text and exit
  

This test is hacky, but it covers the contents of Capytui.start, which is nice.
Due to limitations of cram, this test solely prints out each frame after each
"key" event. These prints occur from within a let%arr block.

Github CI removes /dev/tty which makes this test show some warning messages.
The warning messages are important, but they are also not the purpose of this test.
I attempted a workaround to still get /dev/tty in Github CI using `script(1)`, but
which worked on linux ci, but it did not work on macos CI, so I am instead changing this
test no not outright disable tests in macos.


  $ echo "12345" | ./bin/test_integration_key_events.exe 2> /dev/null
  Press some keys!
  
  
  
  
  
  
  Press some keys!
  Key 1
  
  
  
  
  
  Press some keys!
  Key 2
  Key 1
  
  
  
  
  Press some keys!
  Key 3
  Key 2
  Key 1
  
  
  
  Press some keys!
  Key 4
  Key 3
  Key 2
  Key 1
  
  
  Press some keys!
  Key 5
  Key 4
  Key 3
  Key 2
  Key 1
  
  Press some keys!
  Key Enter
  Key 5
  Key 4
  Key 3
  Key 2
  Key 1
