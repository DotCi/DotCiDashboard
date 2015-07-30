package dotci.dashboard.DotCiDashboard;


import com.groupon.jenkins.util.*;
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
        JsonResponse.render(req, rsp, this);
    }
    @Exported
    public List<String> getProjects(){
       return Arrays.asList("x") ;
    }
}
