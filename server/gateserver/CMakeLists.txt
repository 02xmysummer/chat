cmake_minimum_required(VERSION 3.27)
project(QChatter)

# 设置C++标准
set(CMAKE_CXX_STANDARD 11)

# 添加头文件路径（项目自定义头文件）
include_directories(${PROJECT_SOURCE_DIR}/include)

# 辅助函数收集源文件（注意潜在风险，建议手动指定源文件）
aux_source_directory(${PROJECT_SOURCE_DIR}/src SRC)

find_package(Boost REQUIRED COMPONENTS system filesystem thread)

# 添加可执行文件
add_executable(app ${SRC})         

# 包含目录配置
target_include_directories(app PRIVATE
    ${Boost_INCLUDE_DIRS}
)

# 链接库配置
target_link_libraries(app PRIVATE
    # 使用Boost的导入目标
    Boost::system  
    Boost::filesystem
    Boost::thread
)
