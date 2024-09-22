Attribute VB_Name = "Module2"
Sub FormatWords()
    Dim oWord As Range
    Dim iLength As Integer
    Dim iBoldLength As Integer

    ' Loop through each word in the document
    For Each oWord In ActiveDocument.Words
        iLength = Len(Trim(oWord.Text))
        ' Check if word length is 1 to bold the entire word
        If iLength = 1 Then
            oWord.Font.Bold = True
            oWord.Font.Name = "Comic Sans MS"
        Else
            ' Calculate 30% of the word length for words longer than one character
            iBoldLength = Round(iLength * 0.3)

            ' Apply bold to the first 30% of the word
            With oWord
                .StartOf Word.WdUnits.wdWord, wdMove
                .MoveEnd Word.WdUnits.wdCharacter, iBoldLength
                .Font.Bold = True
                .Font.Name = "Comic Sans MS"
            End With
        End If
    Next oWord
End Sub
