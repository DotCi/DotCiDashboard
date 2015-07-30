package dotci.dashboard.DotCiDashboard;

import hudson.*;
import hudson.model.*;
import org.kohsuke.stapler.*;
import org.kohsuke.stapler.export.*;

import javax.servlet.*;
import java.io.*;
import java.util.*;

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
    public DotCiDashboardApi getApi() {
        return new DotCiDashboardApi();
    }
}
