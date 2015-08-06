package dotci.dashboard.DotCiDashboard;

import hudson.*;
import hudson.model.*;
import jenkins.model.*;
import org.kohsuke.stapler.*;
import org.kohsuke.stapler.export.*;

import javax.servlet.*;
import java.io.*;
import java.util.*;

@Extension
public class DotCiDashboardBuilder implements RootAction {
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
    public void doCreateView(StaplerRequest req, StaplerResponse rsp) throws IOException, ServletException, InterruptedException, Descriptor.FormException {
        String data = req.getParameter("data");
        String name = req.getParameter("name");
        DotCiDashboardViewItem view = DotCiDashboardView.createView(name,data);

        String viewUrl = Jenkins.getActiveInstance().getRootUrl() + "/dotCiDashBoardView/" + name;

        rsp.setHeader("Location",viewUrl);
    }
}
