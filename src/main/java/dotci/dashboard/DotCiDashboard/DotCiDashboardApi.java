package dotci.dashboard.DotCiDashboard;


import com.groupon.jenkins.dynamic.organizationcontainer.*;
import com.groupon.jenkins.util.*;
import jenkins.model.*;
import org.kohsuke.stapler.*;
import org.kohsuke.stapler.export.*;

import javax.servlet.*;
import java.io.*;
import java.util.*;

@ExportedBean
public class DotCiDashboardApi implements hudson.model.ModelObject{
    @Override
    public String getDisplayName() {
        return "api";
    }
    public void doIndex(StaplerRequest req, StaplerResponse rsp) throws IOException, ServletException {
        rsp.setHeader("Access-Control-Allow-Origin","*");
        JsonResponse.render(req, rsp, new Orgs());
    }
    public void getDynamic(String org, StaplerRequest req, StaplerResponse rsp) throws IOException, ServletException {
        rsp.setHeader("Access-Control-Allow-Origin","*");
        JsonResponse.render(req, rsp, new Projects(org));

    }
}
