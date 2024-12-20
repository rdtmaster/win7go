          #go1.20.14
          $Env:GOARCH=386
          $Env:CGO_ENABLED=1
          $gourl = "https://dl.google.com/go/go1.20.14.windows-386.zip"
          Invoke-WebRequest $gourl -OutFile ./go1.20.zip
          Expand-Archive "go1.20.zip" ./
          Rename-Item -Path "go" -NewName "go1.20.14"
          $env:GOROOT_BOOTSTRAP=$pwd.path+"/go1.20.14"
          $env:GOROOT=$env:GOROOT_BOOTSTRAP
          
          #build go1.22-devel
          git clone https://github.com/golang/go go1.22t
          cp run.bat ./go1.22t/src
          cd go1.22t/src
          git checkout a2ff3acb0dbb3d4d3628f359f0e1b091a4f0ee9b
          ./all.bat
          cd ../..
          $env:GOROOT_BOOTSTRAP=$pwd.path+"/go1.22t"
          $env:GOROOT=$env:GOROOT_BOOTSTRAP
          
          #build go1.22-devel2
          git clone https://github.com/golang/go go1.22
          cp run.bat ./go1.22/src
          cd go1.22/src
          git checkout 3de6033d0e8022dffee85bd9537f90b1a5ba5e30
          ./all.bat
          cd ../..
          $env:GOROOT_BOOTSTRAP=$pwd.path+"/go1.22"
          $env:GOROOT=$env:GOROOT_BOOTSTRAP
          
          #build go 1.23t (first round)
          git clone https://github.com/golang/go go1.23t
          cp run.bat ./go1.23t/src
          cp revert.bat ./go1.23t/src
          cd go1.23t/src
          git checkout 704401ffa06c60e059c9e6e4048045b4ff42530a
          git revert --no-commit 693def151adff1af707d82d28f55dba81ceb08e1 
          git revert --no-commit 48042aa09c2f878c4faa576948b07fe625c4707a
          #./revert.bat
          ./all.bat
          cd ../..
          $env:GOROOT_BOOTSTRAP=$pwd.path+"/go1.23t"
          $env:GOROOT=$env:GOROOT_BOOTSTRAP
          
          #build go1.23t2
          git clone https://github.com/golang/go go1.23t2
          cp run.bat ./go1.23t2/src
          cp revert.bat ./go1.23t2/src
          cd go1.23t2/src
          git checkout 4742c52e101ecf4aacebe5148a1cb172bdadb1d4
          ./revert.bat
          ./all.bat
          cd ../..
          $env:GOROOT_BOOTSTRAP=$pwd.path+"/go1.23t2"
          $env:GOROOT=$env:GOROOT_BOOTSTRAP
          
          #build go1.23 final
          git clone https://github.com/golang/go go1.23
          cp run.bat ./go1.23/src
          cp revert.bat ./go1.23/src
          cd go1.23/src
          git checkout 4742c52e101ecf4aacebe5148a1cb172bdadb1d4
          ./revert.bat
          ./all.bat
          cd ../..