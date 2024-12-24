Set objShell = CreateObject("WScript.Shell")

' Проверяем, что получили какие-то параметры
If WScript.Arguments.Count > 0 Then
	Set colArgs = WScript.Arguments.Named
	' Описание ярлыка
	strDescription = colArgs.Item("description")
	' Путь для сохранения создаваемого ярлыка
	strDestination = colArgs.Item("destination")
	' Пользовательский значок создаваемого ярлыка
	strIcon = colArgs.Item("icon")
	' Имя создаваемого ярлыка
	strName = colArgs.Item("name")
	' Путь к объекту, на который ссылается ярлык
	strSource = colArgs.Item("source")

	Set objLink = objShell.CreateShortcut(strDestination & "\" & strName & ".lnk")
	' Устанавливаем описание ярлыка, только если задан аргумент description
	If 0 < Len(strDescription) Then
		objLink.Description = strDescription
	End If
	' Устанавливаем пользовательский значок, только если задан аргумент icon
	If 0 < Len(strIcon) Then
		objLink.IconLocation = strIcon
	End If
	objLink.TargetPath = strSource
	objLink.Save
End If