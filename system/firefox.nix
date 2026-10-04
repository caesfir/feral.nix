{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{
  programs = {
    firefox = {
      enable = true;
      package = inputs.firefox-nightly.packages.${pkgs.stdenv.hostPlatform.system}.firefox-nightly-bin;
      languagePacks = [ "en-US" ];
      nativeMessagingHosts.packages = [ pkgs.kdePackages.plasma-browser-integration ];
#       preferences = {
#
#        ### Wayland
#         "widget.wayland.coordinates-scale.enabled"                   = true;
#         "widget.wayland.experimental.pip.enabled"                    = true;
#         "widget.wayland.fractional-scale.enabled"                    = true;
#         "widget.wayland.native-data-session"                         = true;
#         "widget.wayland.opaque-region.enabled"                       = true;
# #         "widget.wayland.session-id"                                 = "00000000-0000-0000-0000-000000000000";
#         "widget.wayland.session-management.enabled"                  = true;
#         "widget.wayland.use-move-to-rect"                            = true;
#         "widget.wayland.vsync.enabled"                               = true;
#         "widget.wayland.vsync.keep-firing-at-idle"                   = true;
#
#        ### GTK
#         "widget.gtk.alt-theme.accent"                                = true;
#         "widget.gtk.alt-theme.scrollbar_active"                      = true;
#         "widget.gtk.alt-theme.selection"                             = true;
#         "widget.gtk.clipboard_timeout_ms"                            = 1000;
#         "widget.gtk.file-manager-show-items-timeout-ms"              = 1000;
#         "widget.gtk.global-menu.enabled"                             = true;
#         "widget.gtk.global-menu.wayland.enabled"                     = true;
#         "widget.gtk.libadwaita-colors.enabled"                       = true;
#         "widget.gtk.middle-click-enabled"                            = true;
#         "widget.gtk.native-context-menus"                            = false;
#         "widget.gtk.native-emoji-dialog"                             = true;
#         "widget.gtk.rounded-bottom-corners.enabled"                  = true;
#         "widget.gtk.settings-portal-timeout-ms"                      = 3000;
#         "widget.gtk.theme-scrollbar-colors.enabled"                  = true;
#         "widget.gtk.titlebar-action-middle-click-enabled"            = true;
#
#        # Color Management
# #         "gfx.color_management.display_profile" = "";
#         "gfx.color_management.enablev4" = true;
#         "gfx.color_management.force_srgb" = false;
#         "gfx.color_management.hdr" = true;
#         "gfx.color_management.hdr.force_enabled" = false;
#         "gfx.color_management.hdr.yuv_to_rgb_video_shader.always" = true;
#         "gfx.color_management.hdr.yuv_to_rgb_video_shader.fallback" = true;
#         "gfx.color_management.mode" = 1;
#         "gfx.color_management.native_srgb" = true;
#         "gfx.color_management.rec2020_gamma_as_rec709" = true;
#         "gfx.color_management.rec709_gamma_as_srgb" = true;
#         "gfx.color_management.rendering_intent" = 0;
#
#        # Promo
#         "browser.contentblocking.report.vpn-promo.url"                         = "";
#         "browser.newtabpage.activity-stream.discoverystream.promoCard.enabled" = false;
#         "browser.newtabpage.activity-stream.discoverystream.promoCard.visible" = false;
#         "browser.promo.pin.enabled"                                            = false;
#         "browser.promo.relay.enabled"                                          = false;
#         "browser.vpn_promo.disallowed_regions"                                 = "";
#         "browser.vpn_promo.enabled"                                            = false;
#         "gfx.webrender.debug.surface-promotion-logging"                        = false;
#         "identity.fxaccounts.toolbar.appMenuSignInPromo.dismissed"             = false;
#         "identity.mobilepromo.android"                                         = "";
#         "identity.mobilepromo.ios"                                             = "";
#         "identity.sendtabpromo.url"                                            = "";
#         "sidebar.verticalTabs.dragToPinPromo.dismissed"                        = true;
#
#        # Sponsor
#         "browser.newtabpage.activity-stream.discoverystream.ctaButtonSponsors" = "";
#         "browser.newtabpage.activity-stream.discoverystream.newSponsoredLabel.enabled" = false;
#         "browser.newtabpage.activity-stream.showSponsored" = false;
#         "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
#         "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
#         "browser.newtabpage.activity-stream.system.showSponsored" = false;
#         "browser.newtabpage.sponsor-protection.enabled" = false;
#         "browser.places.sponsoredSession.timeoutSecs" = 0;
#         "browser.urlbar.quicksuggest.impressionCaps.nonSponsoredEnabled" = false;
#         "browser.urlbar.quicksuggest.impressionCaps.sponsoredEnabled" = false;
#         "browser.urlbar.quicksuggest.nonSponsoredIndex" = 0;
#         "browser.urlbar.quicksuggest.sponsoredIndex" = 0;
#         "browser.urlbar.sponsoredTopSites" = false;
#         "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
#         "browser.urlbar.suggest.quicksuggest.sponsored" = false;
#
#        # Privacy
#         "privacy.window.maxInnerHeight"                              = 720;
#         "privacy.window.maxInnerWidth"                               = 1280;
#         "privacy.window.name.update.enabled"                         = true;
#
#        # Geo
#         "geo.provider.use_geoclue"                                   = false;
#         "geo.provider.geoclue.always_high_accuracy"                  = false;
#         "geo.provider.network.url"                                   = "";
#         "geo.provider.network.timeout"                               = 0;
#         "geo.provider.network.timeToWaitBeforeSending"               = 0;
#         "geo.provider.geoclue.mls_fallback_timeout_ms"               = 0;
#
#        # Crap
#         "browser.newtabpage.activity-stream.default.sites"           = "";
#         "extensions.getAddons.showPane"                              = false;
#         "extensions.htmlaboutaddons.recommendations.enabled"         = false;
#         "browser.discovery.enabled"                                  = false;
#         "browser.newtabpage.activity-stream.feeds.telemetry"         = false;
#         "browser.newtabpage.activity-stream.telemetry"               = false;
#         "app.shield.optoutstudies.enabled"                           = false;
#         "app.normandy.enabled"                                       = false;
#         "app.normandy.api_url"                                       = "";
#         "breakpad.reportURL"                                         = "";
#         "browser.tabs.crashReporting.sendReport"                     = false;
#         "browser.crashReports.unsubmittedCheck.enabled"              = false;
#         "browser.crashReports.unsubmittedCheck.autoSubmit2"          = false;
#         "captivedetect.canonicalURL"                                 = "";
#         "network.captive-portal-service.enabled"                     = false;
#         "network.connectivity-service.enabled"                       = false;
#
#        # More Crap
#         "datareporting.healthreport.uploadEnabled"                   = false;
#         "datareporting.policy.dataSubmissionEnabled"                 = false;
#         "datareporting.usage.uploadEnabled"                          = false;
#
#         };
      };
    };

}
