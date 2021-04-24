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


function mdtable(urnlist, cols::Int64 = 5; hgt::Int64=100)
    hdr = "| "
    for col in 1:cols
        hdr = hdr * " | "
    end
    hdr = hdr * "\n| "
    for col in 1:cols
        hdr = hdr * " --- | "
    end
    hdr = hdr * "\n"

    for i in 1:length(urnlist)
        img = urnlist[i]
        md = linkedMarkdownImage(ict, img, service; ht=hgt, caption="Page $i")
        if (mod(i, cols) == 0)
            hdr = hdr * string("\n| ", md,  " | ")
        else
            hdr = hdr * string( md, " | ")
        end
    end
    hdr
end