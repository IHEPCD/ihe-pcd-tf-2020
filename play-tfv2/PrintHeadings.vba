Option Explicit

Sub PrintHeadings()

' Creates a new document with Heading XX
' style paragraphs only from active document.
' User prompted for max level XX.

Dim para As Paragraph, rng As Range
Dim DocA As Document, DocB As Document
Dim iLevel As Integer, iMaxLevel As Integer

' Ask for max level
iMaxLevel = InputBox("Enter maximum level for Heading style.")
If iMaxLevel = 0 Then Exit Sub

StatusBar = "Printing headings. Please wait..."

Set DocA = ActiveDocument

' Create new document
Set DocB = Word.Documents.Add(DocA.AttachedTemplate.Name)

' Set extra wide page margins
With DocB.PageSetup
   .TopMargin = InchesToPoints(0.25)
   .BottomMargin = InchesToPoints(0.25)
   .LeftMargin = InchesToPoints(0.25)
   .RightMargin = InchesToPoints(0.25)
End With
   
Set rng = DocB.Range

For Each para In DocA.Paragraphs
   DoEvents
   iLevel = 0
   
   ' Check for Heading style
   If para.Format.Style Like "Heading [0-9]" Then
      
      iLevel = Val(Mid(para.Format.Style, 8))
      ' Check for acceptable level
      If iLevel > 0 And iLevel <= iMaxLevel Then
         rng.Collapse wdCollapseEnd
         rng.Text = String(iLevel - 1, vbTab) & _
            Format(iLevel) & ") " & para.Range.Text
      End If
   
   End If
Next para

' Delete any annoying page breaks
Selection.Find.ClearFormatting
Selection.Find.Replacement.ClearFormatting
With Selection.Find
   .Text = "^m"
   .Replacement.Text = ""
   .Forward = True
   .Wrap = wdFindAsk
   .Format = False
   .MatchCase = False
   .MatchWholeWord = False
   .MatchWildcards = False
   .MatchSoundsLike = False
   .MatchAllWordForms = False
End With
Selection.Find.Execute Replace:=wdReplaceAll

' Tell user when done
MsgBox "Done creating new document with headings only."

End Sub