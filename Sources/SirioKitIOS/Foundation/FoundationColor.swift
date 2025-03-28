//
// FoundationColor.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

extension Color {
    public static let mapOfFoundationColor: [String: Any] = [
        "alias/app-interactive-primary-000-default": SirioFoundationColor.aliasAppInteractivePrimary000Default.color,
        "alias/app-interactive-primary-active": SirioFoundationColor.aliasAppInteractivePrimaryActive.color,
        "alias/app-interactive-secondary-default": SirioFoundationColor.aliasAppInteractiveSecondaryDefault.color,
        "alias/background-color-disabled": SirioFoundationColor.aliasBackgroundColorDisabled.color,
        "alias/background-color-primary-dark-110": SirioFoundationColor.aliasBackgroundColorPrimaryDark110.color,
        "alias/background-color-primary-dark-115": SirioFoundationColor.aliasBackgroundColorPrimaryDark115.color,
        "alias/background-color-primary-dark-120": SirioFoundationColor.aliasBackgroundColorPrimaryDark120.color,
        "alias/background-color-primary-light-0": SirioFoundationColor.aliasBackgroundColorPrimaryLight0.color,
        "alias/background-color-primary-light-40": SirioFoundationColor.aliasBackgroundColorPrimaryLight40.color,
        "alias/background-color-primary-light-50": SirioFoundationColor.aliasBackgroundColorPrimaryLight50.color,
        "alias/background-color-primary-light-60": SirioFoundationColor.aliasBackgroundColorPrimaryLight60.color,
        "alias/background-color-secondary-dark-110": SirioFoundationColor.aliasBackgroundColorSecondaryDark110.color,
        "alias/background-color-secondary-dark-120": SirioFoundationColor.aliasBackgroundColorSecondaryDark120.color,
        "alias/background-color-secondary-dark-125": SirioFoundationColor.aliasBackgroundColorSecondaryDark125.color,
        "alias/background-color-secondary-dark-130": SirioFoundationColor.aliasBackgroundColorSecondaryDark130.color,
        "alias/background-color-secondary-light-40": SirioFoundationColor.aliasBackgroundColorSecondaryLight40.color,
        "alias/background-color-secondary-light-50": SirioFoundationColor.aliasBackgroundColorSecondaryLight50.color,
        "alias/background-color-secondary-mid-90": SirioFoundationColor.aliasBackgroundColorSecondaryMid90.color,
        "alias/gradient-accent-primary": SirioFoundationColor.aliasGradientAccentPrimary.map { $0.color },
        "alias/gradient-accent-primary-dark": SirioFoundationColor.aliasGradientAccentPrimaryDark.map { $0.color },
        "alias/interactive-accent-default": SirioFoundationColor.aliasInteractiveAccentDefault.color,
        "alias/interactive-accent-focus": SirioFoundationColor.aliasInteractiveAccentFocus.color,
        "alias/interactive-accent-hover": SirioFoundationColor.aliasInteractiveAccentHover.color,
        "alias/interactive-accent-pressed": SirioFoundationColor.aliasInteractiveAccentPressed.color,
        "alias/interactive-alert-default": SirioFoundationColor.aliasInteractiveAlertDefault.color,
        "alias/interactive-alert-focus": SirioFoundationColor.aliasInteractiveAlertFocus.color,
        "alias/interactive-alert-hover": SirioFoundationColor.aliasInteractiveAlertHover.color,
        "alias/interactive-alert-pressed": SirioFoundationColor.aliasInteractiveAlertPressed.color,
        "alias/interactive-border-focus": SirioFoundationColor.aliasInteractiveBorderFocus.color,
        "alias/interactive-primary-000-default": SirioFoundationColor.aliasInteractivePrimary000Default.color,
        "alias/interactive-primary-default": SirioFoundationColor.aliasInteractivePrimaryDefault.color,
        "alias/interactive-primary-focus": SirioFoundationColor.aliasInteractivePrimaryFocus.color,
        "alias/interactive-primary-hover": SirioFoundationColor.aliasInteractivePrimaryHover.color,
        "alias/interactive-primary-pressed": SirioFoundationColor.aliasInteractivePrimaryPressed.color,
        "alias/interactive-secondary-default": SirioFoundationColor.aliasInteractiveSecondaryDefault.color,
        "alias/interactive-secondary-focus": SirioFoundationColor.aliasInteractiveSecondaryFocus.color,
        "alias/interactive-secondary-hover": SirioFoundationColor.aliasInteractiveSecondaryHover.color,
        "alias/interactive-secondary-pressed": SirioFoundationColor.aliasInteractiveSecondaryPressed.color,
        "alias/interactive-success-default": SirioFoundationColor.aliasInteractiveSuccessDefault.color,
        "alias/interactive-success-focus": SirioFoundationColor.aliasInteractiveSuccessFocus.color,
        "alias/interactive-success-hover": SirioFoundationColor.aliasInteractiveSuccessHover.color,
        "alias/interactive-success-pressed": SirioFoundationColor.aliasInteractiveSuccessPressed.color,
        "alias/interactive-warning-default": SirioFoundationColor.aliasInteractiveWarningDefault.color,
        "alias/interactive-warning-focus": SirioFoundationColor.aliasInteractiveWarningFocus.color,
        "alias/interactive-warning-hover": SirioFoundationColor.aliasInteractiveWarningHover.color,
        "alias/interactive-warning-pressed": SirioFoundationColor.aliasInteractiveWarningPressed.color,
        "alias/overlay-15-secondary-100": SirioFoundationColor.aliasOverlay15Secondary100.color,
        "alias/overlay-25-primary-000": SirioFoundationColor.aliasOverlay25Primary000.color,
        "alias/overlay-90-dark-primary-120": SirioFoundationColor.aliasOverlay90DarkPrimary120.color,
        "alias/text-color-disabled": SirioFoundationColor.aliasTextColorDisabled.color,
        "alias/text-color-primary-100": SirioFoundationColor.aliasTextColorPrimary100.color,
        "alias/text-color-primary-dark-110": SirioFoundationColor.aliasTextColorPrimaryDark110.color,
        "alias/text-color-primary-light-0": SirioFoundationColor.aliasTextColorPrimaryLight0.color,
        "alias/text-color-primary-light-40": SirioFoundationColor.aliasTextColorPrimaryLight40.color,
        "alias/text-color-primary-light-50": SirioFoundationColor.aliasTextColorPrimaryLight50.color,
        "alias/text-color-secondary-dark-100": SirioFoundationColor.aliasTextColorSecondaryDark100.color,
        "alias/text-color-secondary-dark-130": SirioFoundationColor.aliasTextColorSecondaryDark130.color,
        "global/accent-100": SirioFoundationColor.globalAccent100.color,
        "global/accent-110": SirioFoundationColor.globalAccent110.color,
        "global/accent-120": SirioFoundationColor.globalAccent120.color,
        "global/accent-70": SirioFoundationColor.globalAccent70.color,
        "global/dark-primary-110": SirioFoundationColor.globalDarkPrimary110.color,
        "global/dark-primary-115": SirioFoundationColor.globalDarkPrimary115.color,
        "global/dark-primary-120": SirioFoundationColor.globalDarkPrimary120.color,
        "global/dark-primary-130": SirioFoundationColor.globalDarkPrimary130.color,
        "global/dark-secondary-110": SirioFoundationColor.globalDarkSecondary110.color,
        "global/dark-secondary-120": SirioFoundationColor.globalDarkSecondary120.color,
        "global/dark-secondary-125": SirioFoundationColor.globalDarkSecondary125.color,
        "global/dark-secondary-130": SirioFoundationColor.globalDarkSecondary130.color,
        "global/gradient-01": SirioFoundationColor.globalGradient01.map { $0.color },
        "global/gradient-02": SirioFoundationColor.globalGradient02.map { $0.color },
        "global/gradient-03": SirioFoundationColor.globalGradient03.map { $0.color },
        "global/light-primary-40": SirioFoundationColor.globalLightPrimary40.color,
        "global/light-primary-50": SirioFoundationColor.globalLightPrimary50.color,
        "global/light-primary-60": SirioFoundationColor.globalLightPrimary60.color,
        "global/light-secondary-40": SirioFoundationColor.globalLightSecondary40.color,
        "global/light-secondary-50": SirioFoundationColor.globalLightSecondary50.color,
        "global/light-secondary-60": SirioFoundationColor.globalLightSecondary60.color,
        "global/mid-primary-70": SirioFoundationColor.globalMidPrimary70.color,
        "global/mid-primary-80": SirioFoundationColor.globalMidPrimary80.color,
        "global/mid-primary-90": SirioFoundationColor.globalMidPrimary90.color,
        "global/mid-secondary-70": SirioFoundationColor.globalMidSecondary70.color,
        "global/mid-secondary-80": SirioFoundationColor.globalMidSecondary80.color,
        "global/mid-secondary-90": SirioFoundationColor.globalMidSecondary90.color,
        "global/primary-000": SirioFoundationColor.globalPrimary000.color,
        "global/primary-100": SirioFoundationColor.globalPrimary100.color,
        "global/secondary-100": SirioFoundationColor.globalSecondary100.color,
        "global/secondary-90": SirioFoundationColor.globalSecondary90.color,
        "global/semantic-alert-100": SirioFoundationColor.globalSemanticAlert100.color,
        "global/semantic-alert-110": SirioFoundationColor.globalSemanticAlert110.color,
        "global/semantic-alert-120": SirioFoundationColor.globalSemanticAlert120.color,
        "global/semantic-alert-130": SirioFoundationColor.globalSemanticAlert130.color,
        "global/semantic-info-100": SirioFoundationColor.globalSemanticInfo100.color,
        "global/semantic-success-100": SirioFoundationColor.globalSemanticSuccess100.color,
        "global/semantic-success-110": SirioFoundationColor.globalSemanticSuccess110.color,
        "global/semantic-success-120": SirioFoundationColor.globalSemanticSuccess120.color,
        "global/semantic-success-130": SirioFoundationColor.globalSemanticSuccess130.color,
        "global/semantic-warning-100": SirioFoundationColor.globalSemanticWarning100.color,
        "global/semantic-warning-110": SirioFoundationColor.globalSemanticWarning110.color,
        "global/semantic-warning-80": SirioFoundationColor.globalSemanticWarning80.color,
        "global/semantic-warning-90": SirioFoundationColor.globalSemanticWarning90.color,
        "specific/card-overlay-gradient-img": SirioFoundationColor.specificCardOverlayGradientImg.map { $0.color },
        "specific/data-entry-border-color-alert": SirioFoundationColor.specificDataEntryBorderColorAlert.color,
        "specific/data-entry-border-color-default": SirioFoundationColor.specificDataEntryBorderColorDefault.color,
        "specific/data-entry-border-color-focus": SirioFoundationColor.specificDataEntryBorderColorFocus.color,
        "specific/data-entry-border-color-hover": SirioFoundationColor.specificDataEntryBorderColorHover.color,
        "specific/data-entry-border-color-success": SirioFoundationColor.specificDataEntryBorderColorSuccess.color,
        "specific/data-entry-border-color-valued": SirioFoundationColor.specificDataEntryBorderColorValued.color,
        "specific/data-entry-border-color-warning": SirioFoundationColor.specificDataEntryBorderColorWarning.color,
        "specific/data-entry-label-color-alert" : SirioFoundationColor.specificDataEntryLabelColorAlert.color,
        "specific/data-entry-label-color-default" : SirioFoundationColor.specificDataEntryLabelColorDefault.color,
        "specific/data-entry-label-color-focus" : SirioFoundationColor.specificDataEntryLabelColorFocus.color,
        "specific/data-entry-label-color-hover" : SirioFoundationColor.specificDataEntryLabelColorHover.color,
        "specific/data-entry-label-color-success" : SirioFoundationColor.specificDataEntryLabelColorSuccess.color,
        "specific/data-entry-label-color-valued" : SirioFoundationColor.specificDataEntryLabelColorValued.color,
        "specific/data-entry-label-color-warning" : SirioFoundationColor.specificDataEntryLabelColorWarning.color,
        "specific/data-entry-placeholder-color-alert" : SirioFoundationColor.specificDataEntryPlaceholderColorAlert.color,
        "specific/data-entry-placeholder-color-default" : SirioFoundationColor.specificDataEntryPlaceholderColorDefault.color,
        "specific/data-entry-placeholder-color-focus" : SirioFoundationColor.specificDataEntryPlaceholderColorFocus.color,
        "specific/data-entry-placeholder-color-hover" : SirioFoundationColor.specificDataEntryPlaceholderColorHover.color,
        "specific/data-entry-placeholder-color-success" : SirioFoundationColor.specificDataEntryPlaceholderColorSuccess.color,
        "specific/data-entry-placeholder-color-valued" : SirioFoundationColor.specificDataEntryPlaceholderColorValued.color,
        "specific/data-entry-placeholder-color-warning" : SirioFoundationColor.specificDataEntryPlaceholderColorWarning.color,
        "specific/option-background-color-focus" : SirioFoundationColor.specificOptionBackgroundColorFocus.color,
        "specific/option-background-color-hover" : SirioFoundationColor.specificOptionBackgroundColorHover.color,
        "specific/option-background-color-pressed" : SirioFoundationColor.specificOptionBackgroundColorPressed.color,
        "specific/option-background-color-valued" : SirioFoundationColor.specificOptionBackgroundColorValued.color,
        "specific/progressbar-background-color" : SirioFoundationColor.specificProgressbarBackgroundColor.map { $0.color }
    ]
}

extension Color {
    public static let aliasAppInteractivePrimary000Default = SirioFoundationColor.aliasAppInteractivePrimary000Default.color
    public static let aliasAppInteractivePrimaryActive = SirioFoundationColor.aliasAppInteractivePrimaryActive.color
    public static let aliasAppInteractiveSecondaryDefault = SirioFoundationColor.aliasAppInteractiveSecondaryDefault.color
    public static let aliasBackgroundColorDisabled = SirioFoundationColor.aliasBackgroundColorDisabled.color
    public static let aliasBackgroundColorPrimaryDark110 = SirioFoundationColor.aliasBackgroundColorPrimaryDark110.color
    public static let aliasBackgroundColorPrimaryDark115 = SirioFoundationColor.aliasBackgroundColorPrimaryDark115.color
    public static let aliasBackgroundColorPrimaryDark120 = SirioFoundationColor.aliasBackgroundColorPrimaryDark120.color
    public static let aliasBackgroundColorPrimaryLight0 = SirioFoundationColor.aliasBackgroundColorPrimaryLight0.color
    public static let aliasBackgroundColorPrimaryLight40 = SirioFoundationColor.aliasBackgroundColorPrimaryLight40.color
    public static let aliasBackgroundColorPrimaryLight50 = SirioFoundationColor.aliasBackgroundColorPrimaryLight50.color
    public static let aliasBackgroundColorPrimaryLight60 = SirioFoundationColor.aliasBackgroundColorPrimaryLight60.color
    public static let aliasBackgroundColorSecondaryDark110 = SirioFoundationColor.aliasBackgroundColorSecondaryDark110.color
    public static let aliasBackgroundColorSecondaryDark120 = SirioFoundationColor.aliasBackgroundColorSecondaryDark120.color
    public static let aliasBackgroundColorSecondaryDark125 = SirioFoundationColor.aliasBackgroundColorSecondaryDark125.color
    public static let aliasBackgroundColorSecondaryDark130 = SirioFoundationColor.aliasBackgroundColorSecondaryDark130.color
    public static let aliasBackgroundColorSecondaryLight40 = SirioFoundationColor.aliasBackgroundColorSecondaryLight40.color
    public static let aliasBackgroundColorSecondaryLight50 = SirioFoundationColor.aliasBackgroundColorSecondaryLight50.color
    public static let aliasBackgroundColorSecondaryMid90 = SirioFoundationColor.aliasBackgroundColorSecondaryMid90.color
    public static let aliasGradientAccentPrimary = SirioFoundationColor.aliasGradientAccentPrimary.map { $0.color }
    public static let aliasGradientAccentPrimaryDark = SirioFoundationColor.aliasGradientAccentPrimaryDark.map { $0.color }
    public static let aliasInteractiveAccentDefault = SirioFoundationColor.aliasInteractiveAccentDefault.color
    public static let aliasInteractiveAccentFocus = SirioFoundationColor.aliasInteractiveAccentFocus.color
    public static let aliasInteractiveAccentHover = SirioFoundationColor.aliasInteractiveAccentHover.color
    public static let aliasInteractiveAccentPressed = SirioFoundationColor.aliasInteractiveAccentPressed.color
    public static let aliasInteractiveAlertDefault = SirioFoundationColor.aliasInteractiveAlertDefault.color
    public static let aliasInteractiveAlertFocus = SirioFoundationColor.aliasInteractiveAlertFocus.color
    public static let aliasInteractiveAlertHover = SirioFoundationColor.aliasInteractiveAlertHover.color
    public static let aliasInteractiveAlertPressed = SirioFoundationColor.aliasInteractiveAlertPressed.color
    public static let aliasInteractiveBorderFocus = SirioFoundationColor.aliasInteractiveBorderFocus.color
    public static let aliasInteractivePrimary000Default = SirioFoundationColor.aliasInteractivePrimary000Default.color
    public static let aliasInteractivePrimaryDefault = SirioFoundationColor.aliasInteractivePrimaryDefault.color
    public static let aliasInteractivePrimaryFocus = SirioFoundationColor.aliasInteractivePrimaryFocus.color
    public static let aliasInteractivePrimaryHover = SirioFoundationColor.aliasInteractivePrimaryHover.color
    public static let aliasInteractivePrimaryPressed = SirioFoundationColor.aliasInteractivePrimaryPressed.color
    public static let aliasInteractiveSecondaryDefault = SirioFoundationColor.aliasInteractiveSecondaryDefault.color
    public static let aliasInteractiveSecondaryFocus = SirioFoundationColor.aliasInteractiveSecondaryFocus.color
    public static let aliasInteractiveSecondaryHover = SirioFoundationColor.aliasInteractiveSecondaryHover.color
    public static let aliasInteractiveSecondaryPressed = SirioFoundationColor.aliasInteractiveSecondaryPressed.color
    public static let aliasInteractiveSuccessDefault = SirioFoundationColor.aliasInteractiveSuccessDefault.color
    public static let aliasInteractiveSuccessFocus = SirioFoundationColor.aliasInteractiveSuccessFocus.color
    public static let aliasInteractiveSuccessHover = SirioFoundationColor.aliasInteractiveSuccessHover.color
    public static let aliasInteractiveSuccessPressed = SirioFoundationColor.aliasInteractiveSuccessPressed.color
    public static let aliasInteractiveWarningDefault = SirioFoundationColor.aliasInteractiveWarningDefault.color
    public static let aliasInteractiveWarningFocus = SirioFoundationColor.aliasInteractiveWarningFocus.color
    public static let aliasInteractiveWarningHover = SirioFoundationColor.aliasInteractiveWarningHover.color
    public static let aliasInteractiveWarningPressed = SirioFoundationColor.aliasInteractiveWarningPressed.color
    public static let aliasOverlay15Secondary100 = SirioFoundationColor.aliasOverlay15Secondary100.color
    public static let aliasOverlay25Primary000 = SirioFoundationColor.aliasOverlay25Primary000.color
    public static let aliasOverlay90DarkPrimary120 = SirioFoundationColor.aliasOverlay90DarkPrimary120.color
    public static let aliasTextColorDisabled = SirioFoundationColor.aliasTextColorDisabled.color
    public static let aliasTextColorPrimary100 = SirioFoundationColor.aliasTextColorPrimary100.color
    public static let aliasTextColorPrimaryDark110 = SirioFoundationColor.aliasTextColorPrimaryDark110.color
    public static let aliasTextColorPrimaryLight0 = SirioFoundationColor.aliasTextColorPrimaryLight0.color
    public static let aliasTextColorPrimaryLight40 = SirioFoundationColor.aliasTextColorPrimaryLight40.color
    public static let aliasTextColorPrimaryLight50 = SirioFoundationColor.aliasTextColorPrimaryLight50.color
    public static let aliasTextColorSecondaryDark100 = SirioFoundationColor.aliasTextColorSecondaryDark100.color
    public static let aliasTextColorSecondaryDark130 = SirioFoundationColor.aliasTextColorSecondaryDark130.color
    public static let globalAccent100 = SirioFoundationColor.globalAccent100.color
    public static let globalAccent110 = SirioFoundationColor.globalAccent110.color
    public static let globalAccent120 = SirioFoundationColor.globalAccent120.color
    public static let globalAccent70 = SirioFoundationColor.globalAccent70.color
    public static let globalDarkPrimary110 = SirioFoundationColor.globalDarkPrimary110.color
    public static let globalDarkPrimary115 = SirioFoundationColor.globalDarkPrimary115.color
    public static let globalDarkPrimary120 = SirioFoundationColor.globalDarkPrimary120.color
    public static let globalDarkPrimary130 = SirioFoundationColor.globalDarkPrimary130.color
    public static let globalDarkSecondary110 = SirioFoundationColor.globalDarkSecondary110.color
    public static let globalDarkSecondary120 = SirioFoundationColor.globalDarkSecondary120.color
    public static let globalDarkSecondary125 = SirioFoundationColor.globalDarkSecondary125.color
    public static let globalDarkSecondary130 = SirioFoundationColor.globalDarkSecondary130.color
    public static let globalGradient01 = SirioFoundationColor.globalGradient01.map { $0.color }
    public static let globalGradient02 = SirioFoundationColor.globalGradient02.map { $0.color }
    public static let globalGradient03 = SirioFoundationColor.globalGradient03.map { $0.color }
    public static let globalLightPrimary40 = SirioFoundationColor.globalLightPrimary40.color
    public static let globalLightPrimary50 = SirioFoundationColor.globalLightPrimary50.color
    public static let globalLightPrimary60 = SirioFoundationColor.globalLightPrimary60.color
    public static let globalLightSecondary40 = SirioFoundationColor.globalLightSecondary40.color
    public static let globalLightSecondary50 = SirioFoundationColor.globalLightSecondary50.color
    public static let globalLightSecondary60 = SirioFoundationColor.globalLightSecondary60.color
    public static let globalMidPrimary70 = SirioFoundationColor.globalMidPrimary70.color
    public static let globalMidPrimary80 = SirioFoundationColor.globalMidPrimary80.color
    public static let globalMidPrimary90 = SirioFoundationColor.globalMidPrimary90.color
    public static let globalMidSecondary70 = SirioFoundationColor.globalMidSecondary70.color
    public static let globalMidSecondary80 = SirioFoundationColor.globalMidSecondary80.color
    public static let globalMidSecondary90 = SirioFoundationColor.globalMidSecondary90.color
    public static let globalPrimary000 = SirioFoundationColor.globalPrimary000.color
    public static let globalPrimary100 = SirioFoundationColor.globalPrimary100.color
    public static let globalSecondary100 = SirioFoundationColor.globalSecondary100.color
    public static let globalSecondary90 = SirioFoundationColor.globalSecondary90.color
    public static let globalSemanticAlert100 = SirioFoundationColor.globalSemanticAlert100.color
    public static let globalSemanticAlert110 = SirioFoundationColor.globalSemanticAlert110.color
    public static let globalSemanticAlert120 = SirioFoundationColor.globalSemanticAlert120.color
    public static let globalSemanticAlert130 = SirioFoundationColor.globalSemanticAlert130.color
    public static let globalSemanticInfo100 = SirioFoundationColor.globalSemanticInfo100.color
    public static let globalSemanticSuccess100 = SirioFoundationColor.globalSemanticSuccess100.color
    public static let globalSemanticSuccess110 = SirioFoundationColor.globalSemanticSuccess110.color
    public static let globalSemanticSuccess120 = SirioFoundationColor.globalSemanticSuccess120.color
    public static let globalSemanticSuccess130 = SirioFoundationColor.globalSemanticSuccess130.color
    public static let globalSemanticWarning100 = SirioFoundationColor.globalSemanticWarning100.color
    public static let globalSemanticWarning110 = SirioFoundationColor.globalSemanticWarning110.color
    public static let globalSemanticWarning80 = SirioFoundationColor.globalSemanticWarning80.color
    public static let globalSemanticWarning90 = SirioFoundationColor.globalSemanticWarning90.color
    public static let specificCardOverlayGradientImg = SirioFoundationColor.specificCardOverlayGradientImg.map { $0.color }
    public static let specificDataEntryBorderColorAlert = SirioFoundationColor.specificDataEntryBorderColorAlert.color
    public static let specificDataEntryBorderColorDefault = SirioFoundationColor.specificDataEntryBorderColorDefault.color
    public static let specificDataEntryBorderColorFocus = SirioFoundationColor.specificDataEntryBorderColorFocus.color
    public static let specificDataEntryBorderColorHover = SirioFoundationColor.specificDataEntryBorderColorHover.color
    public static let specificDataEntryBorderColorSuccess = SirioFoundationColor.specificDataEntryBorderColorSuccess.color
    public static let specificDataEntryBorderColorValued = SirioFoundationColor.specificDataEntryBorderColorValued.color
    public static let specificDataEntryBorderColorWarning = SirioFoundationColor.specificDataEntryBorderColorWarning.color
    public static let specificDataEntryLabelColorAlert = SirioFoundationColor.specificDataEntryLabelColorAlert.color
    public static let specificDataEntryLabelColorDefault = SirioFoundationColor.specificDataEntryLabelColorDefault.color
    public static let specificDataEntryLabelColorFocus = SirioFoundationColor.specificDataEntryLabelColorFocus.color
    public static let specificDataEntryLabelColorHover = SirioFoundationColor.specificDataEntryLabelColorHover.color
    public static let specificDataEntryLabelColorSuccess = SirioFoundationColor.specificDataEntryLabelColorSuccess.color
    public static let specificDataEntryLabelColorValued = SirioFoundationColor.specificDataEntryLabelColorValued.color
    public static let specificDataEntryLabelColorWarning = SirioFoundationColor.specificDataEntryLabelColorWarning.color
    public static let specificDataEntryPlaceholderColorAlert = SirioFoundationColor.specificDataEntryPlaceholderColorAlert.color
    public static let specificDataEntryPlaceholderColorDefault = SirioFoundationColor.specificDataEntryPlaceholderColorDefault.color
    public static let specificDataEntryPlaceholderColorFocus = SirioFoundationColor.specificDataEntryPlaceholderColorFocus.color
    public static let specificDataEntryPlaceholderColorHover = SirioFoundationColor.specificDataEntryPlaceholderColorHover.color
    public static let specificDataEntryPlaceholderColorSuccess = SirioFoundationColor.specificDataEntryPlaceholderColorSuccess.color
    public static let specificDataEntryPlaceholderColorValued = SirioFoundationColor.specificDataEntryPlaceholderColorValued.color
    public static let specificDataEntryPlaceholderColorWarning = SirioFoundationColor.specificDataEntryPlaceholderColorWarning.color
    public static let specificOptionBackgroundColorFocus = SirioFoundationColor.specificOptionBackgroundColorFocus.color
    public static let specificOptionBackgroundColorHover = SirioFoundationColor.specificOptionBackgroundColorHover.color
    public static let specificOptionBackgroundColorPressed = SirioFoundationColor.specificOptionBackgroundColorPressed.color
    public static let specificOptionBackgroundColorValued = SirioFoundationColor.specificOptionBackgroundColorValued.color
    public static let specificProgressbarBackgroundColor = SirioFoundationColor.specificProgressbarBackgroundColor.map { $0.color }
}
