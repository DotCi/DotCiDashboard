package dotci.dashboard.DotCiDashboard;

import com.groupon.jenkins.dynamic.build.*;
import com.groupon.jenkins.dynamic.organizationcontainer.*;
import jenkins.model.*;
import org.kohsuke.stapler.export.*;

import java.util.*;

@ExportedBean
public class Projects {
    private String org;

    public Projects(String org) {
        this.org = org;
    }
    @Exported
    public List<Project>  getProjects(){
        OrganizationContainer org = (OrganizationContainer) Jenkins.getInstance().getItem(this.org);
        List<Project> projects = new ArrayList<Project>();
        for(DynamicProject project : org.getItems()){
           projects.add(new Project(project.getName(), project.getParent().getName()));
        }
        return projects;
    }


    @ExportedBean
    public static class Project {
        @Exported
        public String getName() {
            return name;
        }

        private String name;
        private String org;

        public Project(String name, String org) {
            this.name = name;
            this.org = org;
        }

        @Exported
        public String getOrg() {
            return org;
        }

    }
}
