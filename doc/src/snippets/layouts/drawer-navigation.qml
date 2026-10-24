// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 600
    height: 500
    minimumWidth: 320
    minimumHeight: 300
    visible: true
    title: qsTr("Drawer navigation")

    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                text: stack.depth > 1 ? "‹" : "☰"  // back or menu
                onClicked: stack.depth > 1 ? stack.pop() : drawer.open()
            }
            Label {
                Layout.fillWidth: true
                text: stack.currentItem ? stack.currentItem.title : ""
                font.bold: true
            }
        }
    }

    Drawer {
        id: drawer
        width: Math.min(parent.width * 0.7, 280)
        height: parent.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                width: parent.width
                text: qsTr("Home")
                onClicked: { stack.replace(homePage); drawer.close() }
            }
            ItemDelegate {
                width: parent.width
                text: qsTr("About")
                onClicked: { stack.replace(aboutPage); drawer.close() }
            }
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: homePage
    }

    Component {
        id: homePage
        Page {
            title: qsTr("Home")
            Button {
                anchors.centerIn: parent
                text: qsTr("Open details")
                onClicked: stack.push(aboutPage)
            }
        }
    }

    Component {
        id: aboutPage
        Page {
            title: qsTr("About")
            Label { anchors.centerIn: parent; text: qsTr("About this app") }
        }
    }
}
