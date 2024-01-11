#!/bin/bash
read -ep "$c2 Cap: " -i "$PWD" yno; cd $yno;
a1=($(ls))
a2=($(ee ${a1[@]^}))       ## Cap-letter
a4=($(ee ${a2[@]//_/" '"})) ## rm _
a6=($(ee ${a4[@]%.*}))     ## rm .*
ee ${a6[@]} 
ops=(${a6[@]})



a1=($(ls)); a2=(${a1[@]^}); a4=(${a2[@]//_/"   " }); a6=(${a4[@]//.*/  }); ee ${a6[@]}
