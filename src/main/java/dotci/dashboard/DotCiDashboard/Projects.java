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
           projects.add(new Project(project.getName()));
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
        public Project(String name) {
            this.name = name;
        }

    }
}
