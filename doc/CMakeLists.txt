cmake_minimum_required(VERSION 3.19)

project(QtBridgesDoc VERSION 0.1.0)
set(DOC_CONF "qtbridges.qdocconf")

find_package(Qt6 COMPONENTS ToolsTools HostInfo QUIET)
if (Qt6_FOUND)
    get_target_property(QDOC_EXEC Qt6::qdoc IMPORTED_LOCATION)
    get_target_property(qhelpgenerator_bin Qt6::qhelpgenerator IMPORTED_LOCATION)
   # QT_INSTALL_DOCS contains Qt documentation templates
    set(QT_INSTALL_DOCS "${Qt6_DIR}/../../../doc")
else()
    message(FATAL_ERROR "Failed to find QDoc.")
endif()

add_custom_target(html_docs
    COMMAND ${CMAKE_COMMAND} -E env
        "QT_VERSION=${PROJECT_VERSION}"
        "QT_VER=${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}"
        "QT_INSTALL_DOCS=${QT_INSTALL_DOCS}"
        "BUILDDIR=${CMAKE_SOURCE_DIR}"
        ${QDOC_EXEC} --indexdir ${QT_INSTALL_DOCS} --outputdir ${CMAKE_CURRENT_BINARY_DIR}/html ${DOC_CONF}
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
)

    set(qch_file_name qtbridges)

add_custom_target(qch_docs
    COMMAND ${CMAKE_COMMAND} -E env
        "QT_VERSION=${PROJECT_VERSION}"
        "QT_VER=${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}"
        "QT_INSTALL_DOCS=${QT_INSTALL_DOCS}"
        "BUILDDIR=${CMAKE_SOURCE_DIR}"
        ${QDOC_EXEC} --indexdir ${QT_INSTALL_DOCS} --outputdir ${CMAKE_CURRENT_BINARY_DIR}/html ${DOC_CONF}
        &&
        ${qhelpgenerator_bin} "${CMAKE_CURRENT_BINARY_DIR}/html/${qch_file_name}.qhp" -o "${CMAKE_CURRENT_BINARY_DIR}/${qch_file_name}.qch"

        COMMENT "Building QtHelp files for ${target}..."
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
)
