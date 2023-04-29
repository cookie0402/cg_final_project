if (NOT EXISTS "/Users/ccccqqqq/Desktop/cglab6/cg/Assignment_6/cmake-build-debug/install_manifest.txt")
    message(FATAL_ERROR "Cannot find install manifest: \"/Users/ccccqqqq/Desktop/cglab6/cg/Assignment_6/cmake-build-debug/install_manifest.txt\"")
endif(NOT EXISTS "/Users/ccccqqqq/Desktop/cglab6/cg/Assignment_6/cmake-build-debug/install_manifest.txt")

file(READ "/Users/ccccqqqq/Desktop/cglab6/cg/Assignment_6/cmake-build-debug/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")
foreach (file ${files})
    message(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
    execute_process(
        COMMAND /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove "$ENV{DESTDIR}${file}"
        OUTPUT_VARIABLE rm_out
        RESULT_VARIABLE rm_retval
    )
    if(NOT ${rm_retval} EQUAL 0)
        message(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
    endif (NOT ${rm_retval} EQUAL 0)
endforeach(file)

