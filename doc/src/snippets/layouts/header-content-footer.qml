// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 800
    height: 600
    minimumWidth: 400
    minimumHeight: 300
    visible: true
    title: qsTr("Header, content, footer")

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 8
            anchors.rightMargin: 8

            ToolButton { text: qsTr("New") }
            ToolButton { text: qsTr("Open") }
            ToolButton { text: qsTr("Save") }
            Item { Layout.fillWidth: true }  // pushes what follows to the right
            ToolButton { text: qsTr("Help") }
        }
    }

    footer: ToolBar {
        Label {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 8
            text: qsTr("Ready")
        }
    }

    // The window content fills the space between header and footer
    ScrollView {
        anchors.fill: parent
        contentWidth: availableWidth

        Label {
            width: parent.width
            padding: 16
            wrapMode: Text.Wrap
            text: qsTr("Your main content goes here.")
        }
    }
}
