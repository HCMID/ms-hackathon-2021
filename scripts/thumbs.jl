using CitableImage
using CitableObject


baseurl = "http://www.homermultitext.org/iipsrv"
root = "/project/homer/pyramidal/deepzoom"
service = IIIFservice(baseurl, root)

ict = "http://www.homermultitext.org/ict2/?"


urnbase = "urn:cite2:citeecod:codsang250imgs.v1:sg250"

urns = []
for n in 2:650 
    str = string(urnbase, "_", n, "_", (n - 1), "_0")
    push!(urns,Cite2Urn(str))
end


#linkedMarkdownImage(ict, img, service; ht=100, caption="folio 12 recto")