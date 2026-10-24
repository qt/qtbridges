// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 900
    height: 600
    minimumWidth: 360
    minimumHeight: 300
    visible: true
    title: qsTr("Dashboard grid")

    ScrollView {
        anchors.fill: parent
        contentWidth: availableWidth

        GridLayout {
            width: parent.width
            columns: Math.max(1, Math.floor(width / 240))
            rowSpacing: 16
            columnSpacing: 16

            Repeater {
                model: 8

                Frame {
                    required property int index
                    Layout.fillWidth: true
                    Layout.preferredHeight: 140

                    ColumnLayout {
                        anchors.fill: parent

                        Label {
                            text: qsTr("Card %1").arg(index + 1)
                            font.bold: true
                        }
                        Label {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            wrapMode: Text.Wrap
                            text: qsTr("Short description of the card.")
                        }
                    }
                }
            }
        }
    }
}
