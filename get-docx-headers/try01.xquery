xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";
declare namespace w="http://schemas.openxmlformats.org/wordprocessingml/2006/main";

(:

/w:document/w:body/w:p[w:pPr/w:pStyle/starts-with(./@w:val,"Heading")]/data(w:r):)

for $para in doc("C:\Users\jrhoads\projects\ihe-pcd-tf-2020\get-docx-headers\SampleHeadings.docx|zip\word\document.xml")//w:p

return $para/w:pPr/w:pStyle/data(@*)
(: returnsHeading1 Heading2 Heading3 :)

