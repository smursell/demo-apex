public class SharinPixDemoAlbumImageDownloadCtrl {
    public String jsonImages { get; set; }
    
    public SharinPixDemoAlbumImageDownloadCtrl() {
        Id albumId = ApexPages.currentPage().getParameters().get('id');
        sharinpix.Utils utils = new sharinpix.Utils();
        
        List<Object> albumImages = utils.getAlbumImages(albumId);
        
        Map<String, Object> albumImage;
        String imageId;
        Map<String, Object> imageInfos;
        String name;
        String url;
        List<Map<String, Object>> images = new List<Map<String, Object>>();
        
        for (Object albumImageObj : albumImages) {
            albumImage = (Map<String, Object>)albumImageObj;
            imageId = (String)albumImage.get('public_id');
            imageInfos = (Map<String, Object>)albumImage.get('infos');
            name = (String)imageInfos.get('original_filename') + '.' + (String)imageInfos.get('format');
            url = utils.getImageUrl(
                imageId, 
                new Map<String, Object> { 'original' => true },
                new List<Object>()
            );
            images.add(new Map<String, Object> {
                'imageId' => imageId,
                'name' => name,
                'url' => url
            });
        }
        
        jsonImages = JSON.serialize(images);
    }
}