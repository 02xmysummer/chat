cmake_minimum_required(VERSION 3.27)
project(XChat)

# 设置C++标准
set(CMAKE_CXX_STANDARD 17)
set(BOOST_ROOT /usr)

# 添加头文件路径（项目自定义头文件）
include_directories(${PROJECT_SOURCE_DIR}/include)
include_directories(/usr/include/cppconn) # 注意这里的版本号可能需要根据你的安装进行调整

# 辅助函数收集源文件（注意潜在风险，建议手动指定源文件）
aux_source_directory(${PROJECT_SOURCE_DIR}/src SRC)

# 查找依赖项的顺序必须为：Protobuf -> gRPC
find_package(Protobuf REQUIRED)                  # 必须先于gRPC查找
find_package(gRPC REQUIRED CONFIG)               # 添加CONFIG模式
find_package(Boost REQUIRED COMPONENTS system filesystem thread)

# 设置JSONCPP包含目录（建议改用find_package）
find_package(jsoncpp REQUIRED)                   # 更规范的查找方式
link_directories(/usr/lib/x86_64-linux-gnu) # 这里的路径也可能需要根据你的系统架构和MySQL版本进行调整


# 添加可执行文件
add_executable(app ${SRC} ${PROTO_SRCS})         # 包含生成的Protobuf代码

# 包含目录配置
target_include_directories(app PRIVATE
    ${Boost_INCLUDE_DIRS}
    ${gRPC_INCLUDE_DIRS}
    ${Protobuf_INCLUDE_DIRS}                     # 使用Protobuf的变量名
    ${JSONCPP_INCLUDE_DIRS}
)

# 链接库配置
target_link_libraries(app PRIVATE
    # 使用Boost的导入目标
    ${Boost_LIBRARIES}
    gRPC::grpc 
    gRPC::grpc++                      
    # 显式链接gRPC目标
    protobuf::libprotobuf 
    protobuf::libprotoc    
    # 显式链接Protobuf目标
    jsoncpp
    hiredis
    mysqlcppconn
)

