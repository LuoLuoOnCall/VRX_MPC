# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "wamv_model: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iwamv_model:/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(wamv_model_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/states.msg" NAME_WE)
add_custom_target(_wamv_model_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wamv_model" "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/states.msg" ""
)

get_filename_component(_filename "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/controls.msg" NAME_WE)
add_custom_target(_wamv_model_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wamv_model" "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/controls.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(wamv_model
  "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/states.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wamv_model
)
_generate_msg_cpp(wamv_model
  "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/controls.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wamv_model
)

### Generating Services

### Generating Module File
_generate_module_cpp(wamv_model
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wamv_model
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(wamv_model_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(wamv_model_generate_messages wamv_model_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/states.msg" NAME_WE)
add_dependencies(wamv_model_generate_messages_cpp _wamv_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/controls.msg" NAME_WE)
add_dependencies(wamv_model_generate_messages_cpp _wamv_model_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wamv_model_gencpp)
add_dependencies(wamv_model_gencpp wamv_model_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wamv_model_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(wamv_model
  "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/states.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wamv_model
)
_generate_msg_eus(wamv_model
  "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/controls.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wamv_model
)

### Generating Services

### Generating Module File
_generate_module_eus(wamv_model
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wamv_model
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(wamv_model_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(wamv_model_generate_messages wamv_model_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/states.msg" NAME_WE)
add_dependencies(wamv_model_generate_messages_eus _wamv_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/controls.msg" NAME_WE)
add_dependencies(wamv_model_generate_messages_eus _wamv_model_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wamv_model_geneus)
add_dependencies(wamv_model_geneus wamv_model_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wamv_model_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(wamv_model
  "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/states.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wamv_model
)
_generate_msg_lisp(wamv_model
  "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/controls.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wamv_model
)

### Generating Services

### Generating Module File
_generate_module_lisp(wamv_model
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wamv_model
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(wamv_model_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(wamv_model_generate_messages wamv_model_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/states.msg" NAME_WE)
add_dependencies(wamv_model_generate_messages_lisp _wamv_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/controls.msg" NAME_WE)
add_dependencies(wamv_model_generate_messages_lisp _wamv_model_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wamv_model_genlisp)
add_dependencies(wamv_model_genlisp wamv_model_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wamv_model_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(wamv_model
  "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/states.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wamv_model
)
_generate_msg_nodejs(wamv_model
  "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/controls.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wamv_model
)

### Generating Services

### Generating Module File
_generate_module_nodejs(wamv_model
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wamv_model
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(wamv_model_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(wamv_model_generate_messages wamv_model_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/states.msg" NAME_WE)
add_dependencies(wamv_model_generate_messages_nodejs _wamv_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/controls.msg" NAME_WE)
add_dependencies(wamv_model_generate_messages_nodejs _wamv_model_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wamv_model_gennodejs)
add_dependencies(wamv_model_gennodejs wamv_model_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wamv_model_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(wamv_model
  "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/states.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wamv_model
)
_generate_msg_py(wamv_model
  "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/controls.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wamv_model
)

### Generating Services

### Generating Module File
_generate_module_py(wamv_model
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wamv_model
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(wamv_model_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(wamv_model_generate_messages wamv_model_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/states.msg" NAME_WE)
add_dependencies(wamv_model_generate_messages_py _wamv_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wubin/vrx_ws/src/vrx/rosusv_ws/src/wamv_model/msg/controls.msg" NAME_WE)
add_dependencies(wamv_model_generate_messages_py _wamv_model_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wamv_model_genpy)
add_dependencies(wamv_model_genpy wamv_model_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wamv_model_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wamv_model)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wamv_model
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(wamv_model_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wamv_model)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wamv_model
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(wamv_model_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wamv_model)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wamv_model
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(wamv_model_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wamv_model)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wamv_model
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(wamv_model_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wamv_model)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wamv_model\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wamv_model
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(wamv_model_generate_messages_py std_msgs_generate_messages_py)
endif()
