public class SharinPixDemoAlbumImageDownloadV2Ctrl {
  public List<Id> albumIdList = new List<Id> { '0010Y00000YJr5fQAD' };
  private sharinpix.Client clientInstance { get; set; }

  public SharinPixDemoAlbumImageDownloadV2Ctrl (ApexPages.standardController ctrl) {
    clientInstance = sharinpix.Client.getInstance();
  }

  public String getAlbums() {
    List<Map<String, Object>> albumList = new List<Map<String, Object>>();
    for(Id albumId : albumIdList){
      albumList.add(new Map<String, String> {
        'id' => albumId,
        'token' => fetchSharinPixToken(albumId)
      });
    }
    return JSON.serialize(albumList);
  }

  public String fetchSharinPixToken(Id albumId) {
    return clientInstance.token(
      new Map<String, Object> {
        'exp' => DateTime.now().addHours(1).getTime(),
        'abilities' => new Map<String, Object> {
        albumId => new Map<String, Object> {
          'Access' => new Map<String, Boolean> {
            'see' => true,
            'image_list' => true
          }
        }
      }
    });
  }
}