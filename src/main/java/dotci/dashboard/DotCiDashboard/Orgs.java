package dotci.dashboard.DotCiDashboard;

import com.groupon.jenkins.dynamic.organizationcontainer.*;
import jenkins.model.*;
import org.kohsuke.stapler.export.*;

import java.util.*;

@ExportedBean
public class Orgs {

    @Exported
    public List<OrganizationContainer> getOrgs(){
        List<OrganizationContainer> orgs = Jenkins.getActiveInstance().getItems(OrganizationContainer.class);
        return orgs;
    }
}
