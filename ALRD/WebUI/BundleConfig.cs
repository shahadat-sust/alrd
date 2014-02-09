using System.Web.Optimization;

namespace WebUI
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/Scripts").Include(
                "~/Scripts/lib/jquery-1.9.1.js"
                , "~/Scripts/lib/jquery-ui-1.9.2.js"
                , "~/Scripts/lib/jquery-migrate-1.1.0.js"
                //, "~/Scripts/lib/EditableComboBox.js"
                , "~/Scripts/lib/jquery.blockUI.js"
                , "~/Scripts/lib/date.js"
                , "~/Scripts/lib/autoNumeric-1.7.4.js"
                , "~/Scripts/lib/jquery.ui.timepicker.js"
                , "~/Scripts/lib/jquery.maskedinput.js"
                //, "~/Scripts/lib/jquery.searchabledropdown-1.0.8.min.js"
                , "~/Scripts/hbm-main-nav.js"
                , "~/Scripts/lib/text_hint.js"
                , "~/Scripts/uivalidation.js"
                , "~/Scripts/util.js"
                , "~/Scripts/popup.js"
                , "~/Scripts/jPager.js"
                , "~/Scripts/custom/Home.js"
                , "~/Scripts/GoogleMap.js"

            ));

            bundles.Add(new StyleBundle("~/Content/themes/base").Include(
                "~/Content/themes/base/jquery.ui.all.css"
            ));

            bundles.Add(new StyleBundle("~/Styles").Include(
               "~/Styles/hbm-home.css"
               ,"~/Styles/hbm-cfonts.css"
               , "~/Styles/hbm-site.css"
               , "~/Styles/hbm-common.css"
               , "~/Styles/hbm-header.css"
               , "~/Styles/hbm-mainNav.css"
               , "~/Styles/hbm-gen-content.css"
               , "~/Styles/hbm-view-table.css"
               , "~/Styles/hbm-hotel-info.css"
               , "~/Styles/hbm-side-nav.css"
               , "~/Styles/hbm-datepicker.css"
               , "~/Styles/hbm-timepicker.css"
               , "~/Styles/hbm-search.css"
               , "~/Styles/hbm-hetel-booking.css"
               , "~/Styles/hbm-registration.css"
           ));

            BundleTable.EnableOptimizations = false;
        }
    }
}