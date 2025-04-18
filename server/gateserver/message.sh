protoc --grpc_out=. --cpp_out=. --plugin=protoc-gen-grpc=`which grpc_cpp_plugin` message.proto

mv *.h include/
mv *.cc src/