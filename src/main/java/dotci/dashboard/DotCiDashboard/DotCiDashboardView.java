package dotci.dashboard.DotCiDashboard;


import hudson.*;
import hudson.model.*;
import org.kohsuke.stapler.*;

@Extension
public class DotCiDashboardView implements RootAction{

    @Override
    public String getIconFileName() {
        return null;
    }

    @Override
    public String getDisplayName() {
        return null;
    }

    public Object getDynamic(String viewName, StaplerRequest req, StaplerResponse rsp) {
        return DotCiDashboardViewItemRepository.get().find(viewName);
    }

    @Override
    public String getUrlName() {
        return "dotCiDashBoardView";
    }

    public static DotCiDashboardViewItem createView(String name, String data) {
        DotCiDashboardViewItem item = new DotCiDashboardViewItem(name, data);
        item.save();
        return item;
    }
}

