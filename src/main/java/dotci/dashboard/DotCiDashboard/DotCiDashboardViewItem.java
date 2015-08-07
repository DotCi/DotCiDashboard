package dotci.dashboard.DotCiDashboard;

import com.groupon.jenkins.util.*;
import hudson.model.*;
import org.kohsuke.stapler.*;
import org.kohsuke.stapler.export.*;

import javax.servlet.*;
import java.io.*;

@ExportedBean
public class DotCiDashboardViewItem implements ModelObject {
    @Exported
    public String getConfiguration() {
        return configuration;
    }

    private final String configuration;
    private String name;


    @Exported
    public String getName() {
        return name;
    }

    public DotCiDashboardViewItem(String name, String configuration) {
        this.name = name;
        this.configuration  = configuration;
    }

    public void save() {
       DotCiDashboardViewItemRepository.get().save(this);
    }

    @Override
    public String getDisplayName() {
        return "DotCi Dashboard View";
    }
    public void doApi(StaplerRequest req, StaplerResponse rsp) throws IOException, ServletException {
        rsp.setHeader("Access-Control-Allow-Origin","*");
        JsonResponse.render(req, rsp,this );
    }
}
