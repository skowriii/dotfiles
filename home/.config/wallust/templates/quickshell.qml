pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import QtQuick

Singleton {
    readonly property string backgroundColor: "{{background}}";
    readonly property string secondaryBackgroundColor: "{{color9}}";
    readonly property string hoverSecondaryBackgroundColor: "{{color1 | darken(0.3)}}";
    readonly property string foregroundColor: "{{foreground}}";
    readonly property string hoverForegroundColor: "{{color8}}";
    readonly property string secondaryForegroundColor: "{{color15 | saturate(0.5) | darken(0.25)}}";
    readonly property string hoverSecondaryForegroundColor: "{{color15 | saturate(0.5) | darken(0.5)}}";
}
