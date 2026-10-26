// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Layouts

ApplicationWindow {
    width: 1100
    height: 700
    minimumWidth: 640
    minimumHeight: 400
    visible: true
    title: qsTr("Three-pane workspace")

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem { text: qsTr("&Open...") }
            MenuItem { text: qsTr("&Quit"); onTriggered: Qt.quit() }
        }
        Menu {
            title: qsTr("&View")
            MenuItem { text: qsTr("Show &inspector"); checkable: true; checked: true }
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

    SplitView {
        anchors.fill: parent

        // Tools
        Pane {
            SplitView.preferredWidth: 200
            SplitView.minimumWidth: 120

            ColumnLayout {
                anchors.fill: parent
                Label { text: qsTr("Tools"); font.bold: true }
                Button { Layout.fillWidth: true; text: qsTr("Select") }
                Button { Layout.fillWidth: true; text: qsTr("Draw") }
                Item { Layout.fillHeight: true }
            }
        }

        // Work area
        Rectangle {
            SplitView.fillWidth: true
            color: palette.base

            Label {
                anchors.centerIn: parent
                text: qsTr("Work area")
                opacity: 0.6
            }
        }

        // Inspector
        Pane {
            SplitView.preferredWidth: 260
            SplitView.minimumWidth: 160

            ColumnLayout {
                anchors.fill: parent
                Label { text: qsTr("Inspector"); font.bold: true }
                TextField { Layout.fillWidth: true; placeholderText: qsTr("Name") }
                CheckBox { text: qsTr("Visible") }
                Item { Layout.fillHeight: true }
            }
        }
    }
}
