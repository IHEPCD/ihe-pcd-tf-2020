xquery version "3.0";


declare namespace ext="http://www.altova.com/xslt-extensions";

declare namespace w="http://schemas.openxmlformats.org/wordprocessingml/2006/main";

(:  /w:document/w:body/w:p[w:pPr/w:pStyle/starts-with(./@w:val,"Heading")]/data(w:r)

for $para in doc("C:\Users\jrhoads\projects\ihe-pcd-tf-2020\get-docx-headers\SampleHeadings.docx|zip\word\document.xml")//w:p
:)

(:
problem with this: lots of extra whitespace, including returns, in <b>{$para/data(w:r)}</b>
:)
for $para in doc("document.xml")//w:p[w:pPr/w:pStyle/starts-with(./@w:val,"Heading")]
 return ( <p><style-name>{$para/w:pPr/w:pStyle/data(@*)}</style-name>, <content>{$para/normalize-space(data(w:r))}</content></p>)

