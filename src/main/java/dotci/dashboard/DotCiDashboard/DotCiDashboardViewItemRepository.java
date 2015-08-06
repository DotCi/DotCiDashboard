package dotci.dashboard.DotCiDashboard;

import com.google.inject.*;
import com.groupon.jenkins.*;
import com.groupon.jenkins.mongo.*;
import com.mongodb.*;
import org.mongodb.morphia.*;

public class DotCiDashboardViewItemRepository extends MongoRepository{
    public static final String COLLECTION_NAME = "dotci_dashboard_views";
    @Inject
    public DotCiDashboardViewItemRepository(Datastore datastore) {
        super(datastore);
    }
    public static DotCiDashboardViewItemRepository get() {
        return SetupConfig.get().getInjector().getInstance(DotCiDashboardViewItemRepository.class);
    }


    public void save(DotCiDashboardViewItem dotCiDashboardViewItem) {
        BasicDBObject doc = new BasicDBObject("name", dotCiDashboardViewItem.getName()).append("configuration", dotCiDashboardViewItem.getConfiguration());
        getCollection().insert(doc);
    }
    protected DBCollection getCollection() {
        return getDatastore().getDB().getCollection(COLLECTION_NAME);
    }

    public DotCiDashboardViewItem find(String viewName) {
        BasicDBObject query = new BasicDBObject("name", viewName);
        DBObject item = getCollection().findOne(query);
        return new DotCiDashboardViewItem((String)item.get("name"),(String)item.get("configuration"));
    }
}
