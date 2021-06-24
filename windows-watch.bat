@ECHO OFF
:loop
  cls
  %*
  timeout /t 5 > NUL
goto loop


# sample usage: test kubectl get pods

# script must be in the same path 
