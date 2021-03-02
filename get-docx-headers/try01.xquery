xquery version "3.0";


declare namespace ext="http://www.altova.com/xslt-extensions";
n 
declare namespace w="http://schemas.openxmlformats.org/wordprocessingml/2006/main";

(:  /w:document/w:body/w:p[w:pPr/w:pStyle/starts-with(./@w:val,"Heading")]/data(w:r)

for $para in doc("C:\Users\jrhoads\projects\ihe-pcd-tf-2020\get-docx-headers\SampleHeadings.docx|zip\word\document.xml")//w:p
:)
for $para in doc("document.xml")//w:p[w:pPr/w:pStyle/starts-with(./@w:val,"Heading")]


(: return ($para/w:pPr/w:pStyle/data(@*))
 returns Heading1 Heading2 Heading3 :)
 
 return $para/data(w:r)
 (:
 <?xml version="1.0" encoding="UTF-8"?>
                This is Heading 1
             
                This is Heading 2 
             
                This is Heading 3
 :)

