package dotci.dashboard.DotCiDashboard;

import hudson.*;
import hudson.model.*;

@Extension
public class DotCiDashboard implements RootAction {
    @Override
    public String getIconFileName() {
        return null;
    }

    @Override
    public String getDisplayName() {
        return "DotCi Dashboard";
    }

    @Override
    public String getUrlName() {
        return "dotciDashboard";
    }
}
