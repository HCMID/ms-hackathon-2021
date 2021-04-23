using CitableImage
using CitableObject


baseurl = "http://www.homermultitext.org/iipsrv"
root = "/project/homer/pyramidal/deepzoom"
service = IIIFservice(baseurl, root)

ict = "http://www.homermultitext.org/ict2/?"
linkedMarkdownImage(ict, img, service; ht=100, caption="folio 12 recto")
