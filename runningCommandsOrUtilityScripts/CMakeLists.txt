cmake_minimum_required(VERSION 3.5)
project("Executing commands and utility scripts in CMake")

set(SAMPLE_SCRIPT "${PROJECT_SOURCE_DIR}/sampleScript.sh")

# Using execute_process -> runs upon execution of cmake
## Output redirection `>` cannot be used
execute_process(
	COMMAND ${SAMPLE_SCRIPT} "${PROJECT_SOURCE_DIR}/dummyFile1.txt" "${PROJECT_SOURCE_DIR}/dummyFile2.txt"
	RESULT_VARIABLE executeProcessResult
	OUTPUT_FILE "${PROJECT_SOURCE_DIR}/src/execute_process_out"
)

# Using add_custom_command & add_custom_target
## Output redirection `>` allowed
add_custom_target(
	CUSTOM_TARGET ALL
	COMMENT "add_custom_target is now running"
)

add_custom_command(
	TARGET CUSTOM_TARGET
	PRE_BUILD
	WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
	COMMAND ${SAMPLE_SCRIPT} "${PROJECT_SOURCE_DIR}/dummyFile1.txt" "${PROJECT_SOURCE_DIR}/dummyFile2.txt" > "${PROJECT_SOURCE_DIR}/src/custom_command_output"
	COMMENT "add_custom_command is now running"
)
