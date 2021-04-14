# Отчёт по lab03

## Сначала были выполнены команды из учебного материала

```sh
export GITHUB_USERNAME=matveybaykalov

cd ${GITHUB_USERNAME}/workspace
pushd .
source scripts/active

git clone https://github.com/${GITHUB_USERNAME}/lab02.git projects/lab03
cd projects/lab03
git remote remove origin
git remote add origin https://github.com/${GITHUB_USERNAME}/lab03.git

g++ -std=c++11 -I./include -c sources/print.cpp
ls print.o
nm print.o | grep print
ar rvs print.a print.o
file print.a
g++ -std=c++11 -I./include -c examples/example1.cpp
ls example1.o
g++ example1.o print.a -o example1
./example1 && echo

g++ -std=c++11 -I./include -c examples/example2.cpp
nm example2.o
g++ example2.o print.a -o example2
./example2
cat log.txt && echo

rm -rf example1.o example2.o print.o
rm -rf print.a
rm -rf example1 example2
rm -rf log.txt

cat > CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.4)
project(print)
EOF

cat >> CMakeLists.txt <<EOF
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
EOF

cat >> CMakeLists.txt <<EOF
add_library(print STATIC \${CMAKE_CURRENT_SOURCE_DIR}/sources/print.cpp)
EOF

cat >> CMakeLists.txt <<EOF
include_directories(\${CMAKE_CURRENT_SOURCE_DIR}/include)
EOF

cmake -H. -B_build
cmake --build _build

cat >> CMakeLists.txt <<EOF

add_executable(example1 \${CMAKE_CURRENT_SOURCE_DIR}/examples/example1.cpp)
add_executable(example2 \${CMAKE_CURRENT_SOURCE_DIR}/examples/example2.cpp)
EOF

cat >> CMakeLists.txt <<EOF

target_link_libraries(example1 print)
target_link_libraries(example2 print)
EOF

cmake --build _build
cmake --build _build --target print
cmake --build _build --target example1
cmake --build _build --target example2

ls -la _build/libprint.a
_build/example1 && echo
_build/example2
cat log.txt && echo
rm -rf log.txt

git clone https://github.com/tp-labs/lab03 tmp
mv -f tmp/CMakeLists.txt .
rm -rf tmp

cat CMakeLists.txt
cmake -H. -B_build -DCMAKE_INSTALL_PREFIX=_install
cmake --build _build --target install
tree _install

git add CMakeLists.txt
git commit -m"added CMakeLists.txt"
git push origin master
```

## Выполнение домашнего задания

Предварительно была создана директория и удалённый репозиторий task_timp_lab03
```sh
mkdir task_timp_lab03
cd task_timp_lab03
```
В текущую директорию был склонирован репозитория с заданием и удалены лишние файлы
```sh
git clone https://github.com/tp-labs/lab03.git .
rm -rf CMakeLists.txt
rm -rf preview.png
rm -rf LICENSE
rm -rf README.md
```
Был проинициализирован локальный репозиторий
```sh
git remote remove origin
git remote add origin https://github.com/matveybaykalov/timp_task_lab03.git
```
### Задание 1
В папке formatter_lib был создан файл CMakeLists.txt и открыт через vim для редактирования 
```sh
cd formatter_lib
touch CMakeLists.txt
vim CMakeLists.txt
```
В CMakeLists.txt был написан текст
```CMake
cmake_minimum_required(VERSION 3.4)
project(formatter)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(formatter  STATIC ${CMAKE_CURRENT_SOURCE_DIR}/formatter.cpp)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
```
Затем была создана папка _build, в которую был собран проект
```sh
mkdir _build
cd _build
cmake ..
cmake --build .
```
### Задание 2
В папке formatter_ex_lib был создан файл CMakeLists.txt и открыт через vim для редактирования
```sh
cd ../..
cd formatter_ex_lib
touch CMakeLists.txt
vim CMakeLists.txt
```
В CMakeLists.txt был написан текст
```CMake
cmake_minimum_required(VERSION 3.4)
project(fomatter_ex)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(formatter_ex STATIC ${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex.cpp)
add_library(formatter STATIC ${CMAKE_CURRENT_SOURCE_DIR}/../formatter_lib/formatter.cpp)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_lib)

target_link_libraries(formatter_ex formatter)
```
Затем была создана папка _build, в которую был собран проект
```sh
mkdir _build
cd _build
cmake ..
cmake --build .
```
### Задание 3
В папке hello_world_application был создан файл CMakeLists.txt и открыт через vim для редактирования
```sh
cd ../..
cd hello_world_application
touch CMakeLists.txt
vim CMakeLists.txt
```
В CMakeLists.txt был написан текст
```CMake
cmake_minimum_required(VERSION 3.4)
project(print)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(myExe hello_world.cpp)

add_library(formatter_ex STATIC ${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib/formatter_ex.cpp)
add_library(formatter STATIC ${CMAKE_CURRENT_SOURCE_DIR}/../formatter_lib/formatter.cpp)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_lib)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib)

target_link_libraries(formatter_ex formatter)

target_link_libraries(myExe formatter_ex)
```
Затем была создана папка _build, в которую был собран проект
```sh
mkdir _build
cd _build
cmake ..
cmake --build .
```
В папке solver_application был создан файл CMakeLists.txt и открыт через vim для редактирования
```sh
cd ../..
cd solver_application
touch CMakeLists.txt
vim CMakeLists.txt
```
В CMakeLists.txt был написан текст
```CMake
cmake_minimum_required(VERSION 3.4)
project(solver)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(myExe equation.cpp)

add_library(formatter STATIC ${CMAKE_CURRENT_SOURCE_DIR}/../formatter_lib/formatter.cpp)
add_library(formatter_ex STATIC ${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib/formatter_ex.cpp)
add_library(solver_lib STATIC ${CMAKE_CURRENT_SOURCE_DIR}/../solver_lib/solver.cpp)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_lib)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../solver_lib)

target_link_libraries(formatter_ex formatter)

target_link_libraries(myExe formatter_ex)
target_link_libraries(myExe solver_lib)
```
Затем была создана папка _build, в которую был собран проект
```sh
mkdir _build
cd _build
cmake ..
cmake --build
```
В конце работы все изменения были залиты на гитхаб
```sh
git add .
git commit -m "Complit task"
git push origin master
```