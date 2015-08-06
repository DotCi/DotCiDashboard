package dotci.dashboard.DotCiDashboard;

import hudson.model.*;

public class DotCiDashboardViewItem implements ModelObject {
    public String getConfiguration() {
        return configuration;
    }

    private final String configuration;
    private String name;


    public String getName() {
        return name;
    }

    public DotCiDashboardViewItem(String name, String configuration) {
        this.name = name;
        this.configuration  = configuration;
    }

    public String getUrl() {
        return null;
    }

    public void save() {
       DotCiDashboardViewItemRepository.get().save(this);
    }

    @Override
    public String getDisplayName() {
        return "DotCi Dashboard View";
    }
}
