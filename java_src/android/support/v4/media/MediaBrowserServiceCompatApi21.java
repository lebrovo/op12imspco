package android.support.v4.media;

import android.content.Context;
import android.content.Intent;
import android.media.browse.MediaBrowser;
import android.media.session.MediaSession;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.service.media.MediaBrowserService;
import java.util.ArrayList;
import java.util.List;

class MediaBrowserServiceCompatApi21 {

    public interface ServiceCompatProxy {
        BrowserRoot onGetRoot(String str, int i, Bundle bundle);

        void onLoadChildren(String str, ResultWrapper<List<Parcel>> resultWrapper);
    }

    public static Object createService(Context context, ServiceCompatProxy serviceProxy) {
        return new MediaBrowserServiceAdaptor(context, serviceProxy);
    }

    public static void onCreate(Object serviceObj) {
        ((MediaBrowserService) serviceObj).onCreate();
    }

    public static IBinder onBind(Object serviceObj, Intent intent) {
        return ((MediaBrowserService) serviceObj).onBind(intent);
    }

    public static void setSessionToken(Object serviceObj, Object token) {
        ((MediaBrowserService) serviceObj).setSessionToken((MediaSession.Token) token);
    }

    public static void notifyChildrenChanged(Object serviceObj, String parentId) {
        ((MediaBrowserService) serviceObj).notifyChildrenChanged(parentId);
    }

    static class ResultWrapper<T> {
        MediaBrowserService.Result mResultObj;

        ResultWrapper(MediaBrowserService.Result result) {
            this.mResultObj = result;
        }

        /* JADX DEBUG: Multi-variable search result rejected for r1v2, resolved type: android.service.media.MediaBrowserService$Result */
        /* JADX DEBUG: Multi-variable search result rejected for r0v5, resolved type: android.service.media.MediaBrowserService$Result */
        /* JADX WARN: Multi-variable type inference failed */
        public void sendResult(T result) {
            if (result instanceof List) {
                this.mResultObj.sendResult(parcelListToItemList(result));
            } else if (result instanceof Parcel) {
                T parcel = result;
                parcel.setDataPosition(0);
                this.mResultObj.sendResult(MediaBrowser.MediaItem.CREATOR.createFromParcel(parcel));
                parcel.recycle();
            } else {
                this.mResultObj.sendResult(null);
            }
        }

        public void detach() {
            this.mResultObj.detach();
        }

        /* access modifiers changed from: package-private */
        public List<MediaBrowser.MediaItem> parcelListToItemList(List<Parcel> parcelList) {
            if (parcelList == null) {
                return null;
            }
            ArrayList arrayList = new ArrayList();
            for (Parcel parcel : parcelList) {
                parcel.setDataPosition(0);
                arrayList.add(MediaBrowser.MediaItem.CREATOR.createFromParcel(parcel));
                parcel.recycle();
            }
            return arrayList;
        }
    }

    static class BrowserRoot {
        final Bundle mExtras;
        final String mRootId;

        BrowserRoot(String rootId, Bundle extras) {
            this.mRootId = rootId;
            this.mExtras = extras;
        }
    }

    /* access modifiers changed from: package-private */
    public static class MediaBrowserServiceAdaptor extends MediaBrowserService {
        final ServiceCompatProxy mServiceProxy;

        MediaBrowserServiceAdaptor(Context context, ServiceCompatProxy serviceWrapper) {
            attachBaseContext(context);
            this.mServiceProxy = serviceWrapper;
        }

        public MediaBrowserService.BrowserRoot onGetRoot(String clientPackageName, int clientUid, Bundle rootHints) {
            BrowserRoot browserRoot = this.mServiceProxy.onGetRoot(clientPackageName, clientUid, rootHints == null ? null : new Bundle(rootHints));
            if (browserRoot == null) {
                return null;
            }
            return new MediaBrowserService.BrowserRoot(browserRoot.mRootId, browserRoot.mExtras);
        }

        @Override // android.service.media.MediaBrowserService
        public void onLoadChildren(String parentId, MediaBrowserService.Result<List<MediaBrowser.MediaItem>> result) {
            this.mServiceProxy.onLoadChildren(parentId, new ResultWrapper<>(result));
        }
    }

    private MediaBrowserServiceCompatApi21() {
    }
}
