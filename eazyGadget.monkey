Import main
Import mojo

'╔════════════════════════════════════════════════════════════════════════════════════════════════╗
'   Styles :    Visual stuff                               
'╚════════════════════════════════════════════════════════════════════════════════════════════════╝
Class ezStyles

	Function Box:Void(style:Int, x:Int, y:Int, width:Int, height:Int, state:Bool = False, r:Int = 0, g:Int = 0, b:Int = 0)
		Select style
			Case 0 ' button, slider, textbox
				SetColorLight
				DrawRect x, y, width, height
				SetColorTrim
				DrawRect x + 1, y + 1, width - 2, height - 2
				If state = True Then SetColorDark Else SetColorLight
				DrawRect x + 2, y + 2, width - 4, height - 4
				SetColor 255, 255, 255
			Case 1 'canvas
				SetColorLight
				DrawRect x, y, width, height
				SetColorTrim
				DrawRect x + 1, y + 1, width - 2, height - 2
				SetColor r, g, b
				DrawRect x + 2, y + 2, width - 4, height - 4
				SetColor 255, 255, 255
			Case 2 ' check box
				SetColorLight
				DrawRect x, y, width, height
				SetColorTrim
				DrawRect x + 1, y + 1, width - 2, height - 2
				SetColorLight
				DrawRect x + 2, y + 2, width - 4, height - 4
				SetColorTrim
				If state = True
					Local border:Int = height * 0.24
					Local realHeight:Int = height - border * 2;
					DrawLine_PL( x + border, y + border, x + height - border, y + height - border, 2)
					DrawLine_PL( x + border, y + height - border, x + height - border, y + border, 2)
					'DrawLine x + 6, y + 14, x + 9, y + 17
					'DrawLine x + 7, y + 14, x + 9, y + 16
					'DrawLine x + 18, y + 8, x + 9, y + 17
					'DrawLine x + 17, y + 8, x + 8, y + 17
				End If
			Case 3 ' listbox selector
				SetColorDark
				DrawRect x, y - 1, width, height + 2
				SetColor 255, 255, 255
			Case 4 ' listbox scroller
				SetColor 255, 255, 255
				DrawRect x - 2, y + 4, 1, height - 8
			Case 5 ' spinner
				SetColorLight
				DrawRect x, y, width, height
				SetColorTrim
				DrawRect x + 1, y + 1, width - 2, height - 2
				SetColorLight
				DrawRect x + 2, y + 2, width - 4, height - 4
				If state = True Then SetColorDark Else SetColorLight
				DrawRect x + 2, y + 2, width - 44, height - 4
				SetColor 255, 255, 255
				DrawRect x + width - 40, y + 4, 1, height - 8
			Case 6 ' spinner buttons
				If state = True Then SetColorDark Else SetColorLight
				DrawRect x + 2, y + 2, width - 4, height - 4
				SetColor 255, 255, 255
			Case 7 ' combo box
				SetColorLight
				DrawRect x, y, width, height
				SetColorTrim
				DrawRect x + 1, y + 1, width - 2, height - 2
				If state = True Then SetColorDark Else SetColorLight
				DrawRect x + 2, y + 2, width - 4, height - 4
				SetColor 255, 255, 255
				DrawRect x + width - 25, y + 4, 1, height - 8
				DrawRect x + width - 20, y + 7, 13, 1
				DrawRect x + width - 20, y + 12, 13, 1
				DrawRect x + width - 20, y + 17, 13, 1
			Case 8 ' msg box
				SetColor 0, 0, 0
				SetAlpha 0.3
				DrawRect x + 4, y + 4, width, height
				SetAlpha 1.0
				SetColorLight
				DrawRect x, y, width, height
				SetColorTrim
				DrawRect x + 1, y + 1, width - 2, height - 2
				SetColorLight
				DrawRect x + 2, y + 2, width - 4, height - 4
				SetColor 255, 255, 255
				DrawRect x + 6, y + 27, width - 12, 1
			Case 99
				SetColor 0, 0, 0
				SetAlpha 0.6
				DrawRect x, y, width, height
				SetAlpha 1.0
				SetColor 255, 255, 255
		End Select
	End Function
	
	Function SetColorDark:Void()
		SetColor 30, 89, 218
	End Function
	
	Function SetColorLight:Void()
		SetColor 68, 134, 250
	End Function
	
	Function SetColorTrim:Void()
		SetColor 255, 255, 255
	End Function
	
	Function Text(text:String, x:Int, y:Int, center_x:Float = 0.0, center_y:Float = 0.0)
		SetBlend AdditiveBlend
		DrawText(text, x, y, center_x, center_y)
		SetBlend 0
	End Function
	Function DrawLine_PL:Void(XPos#,YPos#,XPos2#,YPos2#,Thickness#=3)
		Local vx:Float = XPos2 - XPos
		Local vy:Float = YPos2 - YPos
		Local Angle:Float=ATan2(vy,vx)
		Local c:Float = Cos(Angle)
		Local s:Float = Sin(Angle)
		Local LineLength:Float = c*vx+s*vy
		Local cl:Float = LineLength*c
		Local sl:Float = LineLength*s
		Local r:Float = Thickness/2.0
		Local sr:Float = s*r
		Local cr:Float = c*r
		'Left Top Coords
		Local Coords:Float[8]
		Coords[0]=XPos+sr
		Coords[1]=YPos-cr
		'Right Top Coords
		Coords[2]=cl+XPos+sr
		Coords[3]=sl+YPos-cr
		'Right Down Coords
		Coords[4]=cl-sr+XPos
		Coords[5]=sl+cr+YPos
		'Left Down Coords
		Coords[6]=XPos-sr
		Coords[7]=YPos+cr
		DrawPoly(Coords)	
	End Function
	
End Class

'╔════════════════════════════════════════════════════════════════════════════════════════════════╗
'   Gadget :	Canvas                               
'╚════════════════════════════════════════════════════════════════════════════════════════════════╝
Class ezCanvas
	Private
	Field x_Pos:Int
	Field y_Pos:Int
	Field width:Int
	Field height:Int
	Field hidden:Bool
	
	Method New(canvas_x:Int, canvas_y:Int, canvas_width:Int, canvas_height:Int)
		x_Pos = canvas_x
		y_Pos = canvas_y
		width = canvas_width
		height = canvas_height
	End Method
	Public
	
	'Summary: Returns mouse x position relative to this canvas
	Method Mouse_X:Int()
		If MouseInCanvas = False Then Return 0
		Return MouseX - x_Pos
	End Method
	
	'Summary: Returns mouse y position relative to this canvas
	Method Mouse_Y:Int()
		If MouseInCanvas = False Then Return 0
		Return MouseY - y_Pos
	End Method
	
	'Summary: Return if the mouse is within the canvas area
	Method MouseInCanvas:Bool()
		If ezMessageBox_Active Then Return
		If hidden Then Return
		If MouseX > x_Pos And MouseX < x_Pos + width And MouseY > y_Pos And MouseY < y_Pos + height
			Return True
		EndIf
	End Method
	
	'Summary: Call before rendering to this canvas, also set CLS color
	Method Push:Void(r:Int = 0, g:Int = 0, b:Int = 0)
		PushMatrix
		If hidden=false ezStyles.Box(1, x_Pos - 2, y_Pos - 2, width + 4, height + 4, False, r, g, b)
		If hidden SetScissor 0, 0, 0, 0 Else SetScissor x_Pos, y_Pos, width, height
		Translate x_Pos, y_Pos
	End Method
	
	'Summary: Call when done rendering on this canvas
	Method Pop:Void()
		SetScissor 0, 0, DeviceWidth, DeviceHeight
		PopMatrix
	End Method
	
	'Summary: Return the x position of the gadget
	Method LayoutX:Int(); Return x_Pos; End Method
	'Summary: Return the y position of the gadget
	Method LayoutY:Int(); Return y_Pos; End Method
	'Summary: Return the width of the gadget
	Method LayoutWidth:Int(); Return width; End Method
	'Summary: Return the height of the gadget
	Method LayoutHeight:Int(); Return height; End Method
	'Summary: hide\Show this gadget, hidden gadgets do not function
	Method Hide:Void(answer:Bool); hidden = answer; End Method
	
End Class

'╔════════════════════════════════════════════════════════════════════════════════════════════════╗
'   Gadget :	Slider                              
'╚════════════════════════════════════════════════════════════════════════════════════════════════╝
Class ezSlider
	Private
	Const VERT:Int = 0, HORZ:Int = 1
	Field x_Pos:Int
	Field y_Pos:Int
	Field width:Int
	Field height:Int
	Field value:Int
	Field size:Float[2]
	Field totalValue:Int
	Field orientation:Int
	Field active:Bool
	Field disabled:Bool
	Field hidden:Bool
	
	Method New(slider_orientation:Int, slider_x:Int, slider_y:Int, slider_length:Int)
		orientation = slider_orientation
		x_Pos = slider_x
		y_Pos = slider_y
		If orientation = HORZ Then width = slider_length; height = 25
		If orientation = VERT Then height = slider_length; width = 25
	End Method
	
	Method MouseOver:Bool()
		If MouseX > x_Pos And MouseX < x_Pos + width And MouseY > y_Pos And MouseY < y_Pos + height
			Return True
		EndIf
	End Method
	Public
	
	'Summary: Set slider (0 .. max value) and visual knob size
	Method SetRange:Void(slider_knob_size:Int, slider_max_value:Int)
		totalValue = (slider_max_value - 1)
		If orientation = HORZ Then size[0] = (Float(width) - Float(slider_knob_size)) / Float(totalValue)
		If orientation = VERT Then size[0] = (Float(height) - Float(slider_knob_size)) / Float(totalValue)
		size[1] = slider_knob_size
	End Method
	
	'Summary: Set slider value
	Method SetValue:Void(slider_value:Int)
		If slider_value < 0 Then Return
		If slider_value > totalValue Then Return
		value = slider_value
	End Method
	
	'Summary: Return slider value
	Method Value:Int(); Return value; End Method
	
	'Summary: Render the gadget
	Method Render:Void(alt:Bool = False)
		If hidden Then Return
		PushMatrix
		If alt = False Then ezStyles.Box(0, x_Pos, y_Pos, width, height, active)
		If alt = True Then ezStyles.Box(4, x_Pos, y_Pos, width, height, active)
		Translate x_Pos, y_Pos
		If size[1] > 0
		If orientation = HORZ Then DrawRect Int( (value * size[0]) + 4), 4, size[1] - 8, height - 8
		If orientation = VERT Then DrawRect 4, Int( (value * size[0]) + 4), width - 8, size[1] - 8
		EndIf
		PopMatrix
		If disabled Then ezStyles.Box(99, x_Pos, y_Pos, width, height)
	End Method
	
	'Summary: Update the gadget
	Method Update:Void()
		If ezMessageBox_Active Then Return
		If disabled or hidden Then Return
		If active = False
			If MouseOver = True and MouseHit = True
				active = True
			End If
		ElseIf active = True
			If MouseDown = False
				active = False
			EndIf	
		End If		
		If active = False Then Return
		If MouseDown = True
			Local i:Int
			If orientation = HORZ
				i = (MouseX - x_Pos) / size[0]
			ElseIf orientation = VERT
				i = (MouseY - y_Pos) / size[0]
			End If
			
			If i > totalValue Then i = totalValue
			SetValue(i)
		EndIf
	End Method
	
	'Summary: Return the x position of the gadget
	Method LayoutX:Int(); Return x_Pos; End Method
	'Summary: Return the y position of the gadget
	Method LayoutY:Int(); Return y_Pos; End Method
	'Summary: Return the width of the gadget
	Method LayoutWidth:Int(); Return width; End Method
	'Summary: Return the height of the gadget
	Method LayoutHeight:Int(); Return height; End Method
	'Summary: Disable\Enable this gadget
	Method Disable:Void(answer:Bool); disabled = answer; End Method
	'Summary: hide\Show this gadget, hidden gadgets do not function
	Method Hide:Void(answer:Bool); hidden = answer; End Method
	
End Class

'╔════════════════════════════════════════════════════════════════════════════════════════════════╗
'   Gadget :	Button                               
'╚════════════════════════════════════════════════════════════════════════════════════════════════╝
Class ezButton
	Private
	Field x_Pos:Int
	Field y_Pos:Int
	Field width:Int
	Field height:Int
	Field label:String
	Field pressed_down:Bool
	Field disabled:Bool
	Field hidden:Bool
	Field forceUpdate:Bool
	
	Method New(button_x:Int, button_y:Int, button_width:Int, button_height:Int, button_label:String = "")
		x_Pos = button_x
		y_Pos = button_y
		width = button_width
		height = button_height
		label = button_label
	End Method
	
	Method MouseOver:Bool()
		If MouseX > x_Pos And MouseX < x_Pos + width And MouseY > y_Pos And MouseY < y_Pos + height
			Return True
		EndIf
	End Method
	
	Method ForceUpdate:Void()
		forceUpdate = True
	End Method
	
	Public
	
	'Summary: Set the text label of the gadget
	Method SetLabel:Void(button_label:String)
		label = button_label
	End Method
	
	'Summary: Render the gadget
	Method Render:Void(style:Int = 0)
		If hidden Then Return
		ezStyles.Box(style, x_Pos, y_Pos, width, height, pressed_down)
		SetScissor x_Pos + 4, y_Pos, width - 8, height
		ezStyles.Text(label, x_Pos + (width / 2), y_Pos + (height / 2), 0.5, 0.5)
		SetScissor 0, 0, DeviceWidth, DeviceHeight
		If disabled Then ezStyles.Box(99, x_Pos, y_Pos, width, height)
	End Method
	
	'Summary: Update the gadget
	Method Update:Bool()
	If ezMessageBox_Active and forceUpdate = False Then Return
	If disabled or hidden Then Return
		If pressed_down = False
			If MouseOver = True and MouseHit = True
				pressed_down = True
			End If
		ElseIf pressed_down = True
			If MouseOver
				If MouseDown = False Then pressed_down = False; Return True
			Else
				pressed_down = False
				Return False
			End If	
		End If
		Return False
	End Method
	
	'Summary: Return the x position of the gadget
	Method LayoutX:Int(); Return x_Pos; End Method
	'Summary: Return the y position of the gadget
	Method LayoutY:Int(); Return y_Pos; End Method
	'Summary: Return the width of the gadget
	Method LayoutWidth:Int(); Return width; End Method
	'Summary: Return the height of the gadget
	Method LayoutHeight:Int(); Return height; End Method
	'Summary: Disable\Enable this gadget
	Method Disable:Void(answer:Bool); disabled = answer; End Method
	'Summary: hide\Show this gadget, hidden gadgets do not function
	Method Hide:Void(answer:Bool); hidden = answer; End Method
	
End Class

'╔════════════════════════════════════════════════════════════════════════════════════════════════╗
'   Gadget :	Text Box                               
'╚════════════════════════════════════════════════════════════════════════════════════════════════╝
Class ezTextBox
	Private
	Field x_Pos:Int
	Field y_Pos:Int
	Field width:Int
	Field box_Width:Int
	Field height:Int
	Field value:String
	Field new_Value:String
	Field selected:Bool
	Field blink:Bool
	Field blink_Timer:Int
	Field label:String
	Field x_Offset:Int
	Field x_Cursor:Int
	Field cursor_Index:Int
	Field font_Width:Int = 7
	Field disabled:Bool
	Field hidden:Bool
	
	Method New(textbox_x:Int, textbox_y:Int, textbox_width:Int, textbox_value:String = "")
		x_Pos = textbox_x
		y_Pos = textbox_y
		width = textbox_width
		box_Width = textbox_width
		height = 25
		value = textbox_value
		new_Value = value
	End Method
	
	Method MouseOver:Bool()
		If MouseX > x_Pos And MouseX < x_Pos + width And MouseY > y_Pos And MouseY < y_Pos + height
			Return True
		EndIf
	End Method
	
	Method StrMid:String(value:String, index:Int, count:Int)
		Return value[ (index - 1) .. ( (index - 1) + count)]
	End Method
	
	Method UpdateBlink:Bool()
		If selected = False Then Return False
		If blink_Timer < Millisecs
			blink_Timer = Millisecs + 250
			If blink = True Then blink = False Else blink = True
		End If
		Return blink
	End Method

	Public
	
	'Summary: Clear the text from the box
	Method Clear:Void()
		SetValue("")
	End Method
	
	'Summary: Set the text label of the gadget
	Method SetLabel:Void(textbox_label:String)
		label = textbox_label
		box_Width = width - TextWidth(label) - 8
		If box_Width <50 Then box_Width = 50
	End Method
	
	'Summary: Return the text box string
	Method Value:String(); Return value; End Method
	
	'Summary: Set the text box string
	Method SetValue:Void(textbox_value:String)
		value = textbox_value
		new_Value = value
	End Method
	
	'Summary: Render the gadget
	Method Render:Void()
		If hidden Then Return
		SetScissor x_Pos, y_Pos, width - box_Width - font_Width, height
		ezStyles.Text(label, x_Pos, y_Pos + (height * 0.5), 0.0, 0.5)
		SetScissor 0, 0, DeviceWidth, DeviceHeight
		ezStyles.Box(0, x_Pos + width - box_Width + 1, y_Pos, box_Width, height, selected)
		PushMatrix
		Translate x_Pos - x_Offset + font_Width, y_Pos
			SetScissor x_Pos + width - box_Width + font_Width, y_Pos, box_Width - (font_Width * 2), height
			ezStyles.Text(new_Value, width - box_Width, height * 0.5, 0, 0.5)
			If UpdateBlink Then DrawRect width - box_Width + (x_Cursor * font_Width), Int( (height * 0.5) - (TextHeight * 0.5)), font_Width, 12
			SetScissor 0, 0, DeviceWidth, DeviceHeight
		PopMatrix
		If disabled Then ezStyles.Box(99, x_Pos + width - box_Width, y_Pos, box_Width, height)
	End Method
	
	'Summary: Update the gadget
	Method Update:Void()
		If ezMessageBox_Active Then Return
		If disabled or hidden Then Return
		If MouseHit
			If MouseOver
				If selected = False Then x_Cursor = value.Length; new_Value = value
				selected = True
			Else
				selected = False
				x_Cursor = 0
				x_Offset = 0
				value = new_Value
			End If
		EndIf
		If selected = False Then Return
		Repeat
            Local char=GetChar()
            If Not char Exit
            If char = CHAR_BACKSPACE
				If x_Cursor = 0 Then Continue
				Local parts:String[2]
				parts[0] = StrMid(new_Value, 1, x_Cursor - 1)
				parts[1] = StrMid(new_Value, x_Cursor + 1, new_Value.Length)
				new_Value = parts[0] + parts[1]
				x_Cursor = x_Cursor - 1
			ElseIf char = CHAR_ENTER
				selected = False
				x_Cursor = 0
				x_Offset = 0
				value = new_Value
			ElseIf char = CHAR_RIGHT
				x_Cursor = x_Cursor + 1
				If x_Cursor > new_Value.Length Then x_Cursor = new_Value.Length
			ElseIf char = CHAR_LEFT
				x_Cursor = x_Cursor - 1
				If x_Cursor <= 0 Then x_Cursor = 0; x_Offset = 0
			ElseIf char >= 32
				Local parts:String[2]
				parts[0] = StrMid(new_Value, 1, x_Cursor)
				parts[1] = StrMid(new_Value, x_Cursor + 1, new_Value.Length)
                new_Value = parts[0] + String.FromChar(char) + parts[1]
				x_Cursor = x_Cursor + 1
			EndIf
        Forever
		If (x_Cursor + 3) > (box_Width / font_Width) Then x_Offset = - ( (box_Width / font_Width) - (x_Cursor + 2)) * font_Width
	End Method
	
	'Summary: Return the x position of the gadget
	Method LayoutX:Int(); Return x_Pos; End Method
	'Summary: Return the y position of the gadget
	Method LayoutY:Int(); Return y_Pos; End Method
	'Summary: Return the width of the gadget
	Method LayoutWidth:Int(); Return width; End Method
	'Summary: Return the height of the gadget
	Method LayoutHeight:Int(); Return height; End Method
	'Summary: Disable\Enable this gadget
	Method Disable:Void(answer:Bool); disabled = answer; End Method
	'Summary: hide\Show this gadget, hidden gadgets do not function
	Method Hide:Void(answer:Bool); hidden = answer; End Method

End Class

'╔════════════════════════════════════════════════════════════════════════════════════════════════╗
'   Gadget :	Check Box                              
'╚════════════════════════════════════════════════════════════════════════════════════════════════╝
Class ezCheckBox
	Private
	Field x_Pos:Int
	Field y_Pos:Int
	Field width:Int
	Field height:Int
	Field label:String
	Field state:Int
	Field disabled:Bool
	Field hidden:Bool
	
	Method New(checkbox_x:Int, checkbox_y:Int, checkbox_width:Int, checkbox_height:Int, checkbox_label:String = "")
		x_Pos = checkbox_x
		y_Pos = checkbox_y
		width = checkbox_width
		height = checkbox_height
		label = checkbox_label
	End Method
	
	Method MouseOver:Bool()
		If MouseX > x_Pos And MouseX < x_Pos + width And MouseY > y_Pos And MouseY < y_Pos + height
			Return True
		EndIf
	End Method
	Public
	
	'Summary: Render the gadget
	Method Render:Void()
		If hidden Then Return
		ezStyles.Box(2, x_Pos, y_Pos, height, height, Bool(state))
		SetScissor x_Pos, y_Pos, width, height
		ezStyles.Text(label, x_Pos + height+7, y_Pos + (height * 0.5), 0, 0.5)
		SetScissor 0, 0, DeviceWidth, DeviceHeight
		If disabled Then ezStyles.Box(99, x_Pos, y_Pos, height, height)
	End Method
	
	'Summary: Update the gadget
	Method Update:Bool()
		If ezMessageBox_Active Then Return
		If disabled or hidden Then Return
		If MouseHit
			If MouseOver
				If state = 1 Then state = 0 Else state = 1
			End If
		EndIf
	End Method
	
	'Summary: Set the State; 1 (checked) or 0 (unchecked) 
	Method SetState:Void(checkbox_state:Int); state = checkbox_state; End Method
	'Summary: Return the State; 1 (checked) or 0 (unchecked)
	Method State:Int(); Return state; End Method
	'Summary: Set the text label of the gadget
	Method SetLabel:Void(checkbox_label:String); label = checkbox_label; End Method
	'Summary: Return the x position of the gadget
	Method LayoutX:Int(); Return x_Pos; End Method
	'Summary: Return the y position of the gadget
	Method LayoutY:Int(); Return y_Pos; End Method
	'Summary: Return the width of the gadget
	Method LayoutWidth:Int(); Return width; End Method
	'Summary: Return the height of the gadget
	Method LayoutHeight:Int(); Return height; End Method
	'Summary: Disable\Enable this gadget
	Method Disable:Void(answer:Bool); disabled = answer; End Method
	'Summary: hide\Show this gadget, hidden gadgets do not function
	Method Hide:Void(answer:Bool); hidden = answer; End Method
	
End Class

'╔════════════════════════════════════════════════════════════════════════════════════════════════╗
'   Gadget :	List Box                            
'╚════════════════════════════════════════════════════════════════════════════════════════════════╝
Class ezListBox
	Private
	Field x_Pos:Int
	Field y_Pos:Int
	Field width:Int
	Field height:Int
	Field list:String[]
	Field font_Width:Int = 7
	Field line_Height:Int = 14
	Field top_Space:Int = 8
	Field index:Int
	Field new_index:Int
	Field slider:ezSlider
	Field disabled:Bool
	Field hidden:Bool
	
	Method New(listbox_x:Int, listbox_y:Int, listbox_width:Int, listbox_height:Int)
		x_Pos = listbox_x
		y_Pos = listbox_y
		width = listbox_width
		height = listbox_height
		slider = New ezSlider(0, x_Pos + width - 25 - 2, y_Pos + 2, height - 4)
	End Method
	
	Method MouseOver:Bool()
		If MouseX > x_Pos And MouseX < x_Pos + width - 27 And MouseY > y_Pos And MouseY < y_Pos + height
			Return True
		EndIf
	End Method
	Public
	
	'Summary: Add an item to the bottom of the list
	Method AddItem:Void(text:String)
		If text.Length = 0 Return
		list = list.Resize(list.Length + 1)
		list[list.Length - 1] = text
		Local a:Int = (list.Length - 1) - ( (height - line_Height - top_Space) / line_Height)
		Local knobSize:Int = (Float(height) / (Float(a) + 1))
		If knobSize < 25 Then knobSize = 25
		If a > 0 slider.SetRange(knobSize, a + 1)
		If a <= 0 slider.SetRange(0, 0)
	End Method
	
	'Summary: Clear all items off the list
	Method Clear:Void()
		slider.SetValue(0)
		slider.SetRange(0, 0)
		list = list.Resize(0)
		index = -999
	End Method
	
	'Summary: Export the list of items
	Method Export:String[] ()
		Local export:String[list.Length]
		For Local a:Int = 0 Until list.Length
			export[a] = list[a]
		Next
		Return export
	End Method
	
	'Summary: Render the list box
	Method Render:Void()
		If hidden Then Return
		ezStyles.Box(0, x_Pos - 2, y_Pos - 2, width + 4, height + 4)
		PushMatrix
		Translate x_Pos + font_Width, y_Pos + top_Space
		SetScissor x_Pos, y_Pos + top_Space, width - font_Width - 25, height-(top_Space*2)
		ezStyles.Box(3, 0, ( (index - slider.Value) * line_Height), width, line_Height-1)
		For Local i:Int = slider.Value Until list.Length
			ezStyles.Text(list[i], 0, ((i-slider.Value) * line_Height))
		Next
		PopMatrix
		SetScissor 0, 0, DeviceWidth, DeviceHeight
		slider.Render(True)
		If disabled Then ezStyles.Box(99, x_Pos, y_Pos, width, height)
	End Method
	
	'Summary: Update the list box
	Method Update:Void()
		If ezMessageBox_Active Then Return
		If disabled or hidden Then Return
		slider.Update
		If MouseOver = False Then Return
		new_index = slider.Value + ( (MouseY - y_Pos - top_Space) / line_Height)
		If MouseHit
			If new_index >= list.Length Then Return
			index = new_index
		End If
	End Method
	
	'Summary: Return the selected index value
	Method Index:Int()
		If index < 0 Then Return 0
		Return index
	End Method
	
	'Summary: Return the selected index text
	Method Item:String()
		If index < 0 Then Return ""
		Return list[index]
	End Method
	
	'Summary: Return the x position of the gadget
	Method LayoutX:Int(); Return x_Pos; End Method
	'Summary: Return the y position of the gadget
	Method LayoutY:Int(); Return y_Pos; End Method
	'Summary: Return the width of the gadget
	Method LayoutWidth:Int(); Return width; End Method
	'Summary: Return the height of the gadget
	Method LayoutHeight:Int(); Return height; End Method
	'Summary: Disable\Enable this gadget
	Method Disable:Void(answer:Bool); disabled = answer; End Method
	'Summary: hide\Show this gadget, hidden gadgets do not function
	Method Hide:Void(answer:Bool); hidden = answer; End Method
	
End Class

'╔════════════════════════════════════════════════════════════════════════════════════════════════╗
'   Gadget :	Spinner
'╚════════════════════════════════════════════════════════════════════════════════════════════════╝
Class ezSpinner
	Private
	Field x_Pos:Int
	Field y_Pos:Int
	Field width:Int
	Field box_Width:Int
	Field height:Int
	Field value:Int
	Field selected:Bool
	Field blink:Bool
	Field blink_Timer:Int
	Field x_Offset:Int
	Field x_Cursor:Int
	Field cursor_Index:Int
	Field font_Width:Int = 7
	Field button_plus:ezButton
	Field button_minus:ezButton
	Field min_Value:Int
	Field max_Value:Int
	Field jump_Value:Int
	Field disabled:Bool
	Field hidden:Bool
	
	Method New(spinner_x:Int, spinner_y:Int)
		x_Pos = spinner_x
		y_Pos = spinner_y
		height = 25
	End Method
	
	Method MouseOver:Bool()
		If MouseX > x_Pos And MouseX < x_Pos + width - 40 And MouseY > y_Pos And MouseY < y_Pos + height
			Return True
		EndIf
	End Method
	
	Public
	
	'Summary: Set the max and min values and step value
	Method SetRange:Void(min:Int, max:Int, steps:Int = 1)
		min_Value = min
		max_Value = max
		jump_Value = steps
		value = min_Value
		Local a:String = max_Value
		box_Width = 44 + TextWidth(a) + 4 + font_Width
		width = box_Width
		button_plus = New ezButton(x_Pos + width - 20, y_Pos, 20, 25, "+")
		button_minus = New ezButton(x_Pos + width - 40, y_Pos, 20, 25, "-")
	End Method
	
	'Summary: Return the spinner value
	Method Value:Int(); Return value; End Method
	
	'Summary: Set the spinner value
	Method SetValue:Void(spinner_value:Int)
		value = spinner_value
		If value > max_Value Then value = min_Value
		If value < min_Value Then value = max_Value
	End Method
	
	'Summary: Render the gadget
	Method Render:Void()
		If hidden Then Return
		ezStyles.Box(5, x_Pos + width - box_Width + 1, y_Pos, box_Width, height, selected)
		PushMatrix
		Translate x_Pos - x_Offset + font_Width, y_Pos
			SetScissor x_Pos + width - box_Width + font_Width - 40, y_Pos, box_Width - (font_Width * 2), height
			ezStyles.Text(value, (width - box_Width), height * 0.5, 0, 0.5)
			SetScissor 0, 0, DeviceWidth, DeviceHeight
		PopMatrix
		button_minus.Render(6)
		button_plus.Render(6)
		If disabled Then ezStyles.Box(99, x_Pos, y_Pos, width, height)
	End Method
	
	'Summary: Update the gadget
	Method Update:Void()
		If ezMessageBox_Active Then Return
		If disabled or hidden Then Return
		If button_plus.Update Then value = value + jump_Value; SetValue(value)
		If button_minus.Update Then value = value - jump_Value; SetValue(value)
	End Method
	
	'Summary: Return the x position of the gadget
	Method LayoutX:Int(); Return x_Pos; End Method
	'Summary: Return the y position of the gadget
	Method LayoutY:Int(); Return y_Pos; End Method
	'Summary: Return the width of the gadget
	Method LayoutWidth:Int(); Return width; End Method
	'Summary: Return the height of the gadget
	Method LayoutHeight:Int(); Return height; End Method
	'Summary: Disable\Enable this gadget
	Method Disable:Void(answer:Bool); disabled = answer; End Method
	'Summary: hide\Show this gadget, hidden gadgets do not function
	Method Hide:Void(answer:Bool); hidden = answer; End Method

End Class

'╔════════════════════════════════════════════════════════════════════════════════════════════════╗
'   Gadget :	Combo box
'╚════════════════════════════════════════════════════════════════════════════════════════════════╝
Class ezComboBox
	Private
	Field x_Pos:Int
	Field y_Pos:Int
	Field width:Int
	Field height:Int
	Field list:String[]
	Field index:Int
	Field active:Bool
	Field disabled:Bool
	Field hidden:Bool
	
	Method MouseOver:Bool()
		If MouseX > x_Pos And MouseX < x_Pos + width And MouseY > y_Pos And MouseY < y_Pos + height
			Return True
		EndIf
	End Method
	
	Method New(combobox_x:Int, combobox_y:Int, combobox_width:Int, combobox_height:Int)
		x_Pos = combobox_x
		y_Pos = combobox_y
		width = combobox_width
		height = combobox_height
	End Method
	Public
	
	'Summary: Add an item to the combo box
	Method AddItem:Void(text:String)
		list = list.Resize(list.Length + 1)
		list[list.Length - 1] = text
	End Method
	
	'Summary: Clear all items
	Method Clear:Void()
		list = list.Resize(0)
		index = 0
	End Method
	
	'Summary: Render this gadget
	Method Render:Void()
		If hidden Then Return
		ezStyles.Box(7, x_Pos, y_Pos, width, height, active)
		SetScissor x_Pos + 4, y_Pos, width - 8 - 25, height
		ezStyles.Text(list[index], x_Pos + (width / 2) - 12, y_Pos + (height / 2), 0.5, 0.5)
		SetScissor 0, 0, DeviceWidth, DeviceHeight
		If disabled Then ezStyles.Box(99, x_Pos, y_Pos, width, height)
	End Method
	
	'Summary: Update this gadget
	Method Update:Void()
	If ezMessageBox_Active Then Return
	If disabled or hidden Then Return
		If MouseHit
			If MouseOver
				If MouseDown active = True
				index = index + 1
				If index > list.Length-1 Then index = 0
			Else
				active = False
			EndIf
		Else
			If MouseDown = False active = False
		End If
	End Method
	
	'Summary: Return the selected index value
	Method Index:Int()
		If index < 0 Then Return 0
		Return index
	End Method
	
	'Summary: Return the selected index text
	Method Item:String()
		If index < 0 Then Return ""
		Return list[index]
	End Method
	
	'Summary: Return the x position of the gadget
	Method LayoutX:Int(); Return x_Pos; End Method
	'Summary: Return the y position of the gadget
	Method LayoutY:Int(); Return y_Pos; End Method
	'Summary: Return the width of the gadget
	Method LayoutWidth:Int(); Return width; End Method
	'Summary: Return the height of the gadget
	Method LayoutHeight:Int(); Return height; End Method
	'Summary: Disable\Enable this gadget
	Method Disable:Void(answer:Bool); disabled = answer; End Method
	'Summary: hide\Show this gadget, hidden gadgets do not function
	Method Hide:Void(answer:Bool); hidden = answer; End Method
	
End Class

'╔════════════════════════════════════════════════════════════════════════════════════════════════╗
'   Gadget :	Label
'╚════════════════════════════════════════════════════════════════════════════════════════════════╝
Class ezLabel
	Private
	Field x_Pos:Int
	Field y_Pos:Int
	Field width:Int
	Field height:Int
	Field text:String
	Field hidden:Bool
	
	Method New(label_x:Int, label_y:Int, label_width:Int)
		x_Pos = label_x
		y_Pos = label_y
		width = label_width
		height = 25
	End Method
	Public
	
	Method SetText:Void(label_text:String)
		text = label_text
	End Method
	
	Method Render:Void()
		If hidden Then Return
		SetScissor x_Pos, y_Pos, width, height
		ezStyles.Text(text, x_Pos, y_Pos + (height / 2), 0, 0.5)
		SetScissor 0, 0, DeviceWidth, DeviceHeight
	End Method
	
	'Summary: Return the x position of the gadget
	Method LayoutX:Int(); Return x_Pos; End Method
	'Summary: Return the y position of the gadget
	Method LayoutY:Int(); Return y_Pos; End Method
	'Summary: Return the width of the gadget
	Method LayoutWidth:Int(); Return width; End Method
	'Summary: Return the height of the gadget
	Method LayoutHeight:Int(); Return height; End Method
	'Summary: hide\Show this gadget, hidden gadgets do not function
	Method Hide:Void(answer:Bool); hidden = answer; End Method
	
End Class

'╔════════════════════════════════════════════════════════════════════════════════════════════════╗
'   Gadget :	MessageBox
'╚════════════════════════════════════════════════════════════════════════════════════════════════╝
Global ezMessageBox_Active:Bool
Global ezMessageBox_Text:String[]
Global ezMessageBox_Title:String
Global ezMessageBox_Button1:ezButton
Global ezMessageBox_Button0:ezButton
Class ezMessageBox
	
	'Summary: Show the message box, style 0 = Yes\No, style 1 = Ok\Cancel
	Function Show:Void(style:Int = 0)
		Local width:Int = 400
		Local height:Int = 100 + ( (ezMessageBox_Text.Length + 1) * 12)
		Local x:Int = (DeviceWidth / 2) - (width / 2)
		Local y:Int = (DeviceHeight / 2) - (height / 2)	
		Local button1_text:String = "Yes"
		Local button0_text:String = "No"
		If style <> 0
			button1_text = "Ok"
			button0_text = "Cancel"
		End If
		If ezMessageBox_Active = False
			ezMessageBox_Active = True
			ezMessageBox_Button1 = New ezButton( (DeviceWidth / 2) - 8 - 50, y + height - 33, 55, 25, button1_text)
				ezMessageBox_Button1.ForceUpdate
			ezMessageBox_Button0 = New ezButton( (DeviceWidth / 2) + 8, y + height - 33, 55, 25, button0_text)
				ezMessageBox_Button0.ForceUpdate
		End If
		ezStyles.Box(8, x, y, width, height)
		ezStyles.Text(ezMessageBox_Title, x + (width / 2), y + 14, 0.5, 0.5)
		PushMatrix
		Translate x + (width / 2), (DeviceHeight / 2) - (ezMessageBox_Text.Length*6)
		For Local a:Int = 0 Until ezMessageBox_Text.Length
			ezStyles.Text(ezMessageBox_Text[a], 0, (a * 12), 0.5, 0.5)
		Next
		PopMatrix
		ezMessageBox_Button1.Render
		ezMessageBox_Button0.Render
	End Function
	
	'Summary: Return when the Yes or Ok button is pressed
	Function YesOk:Bool()
		If ezMessageBox_Active = False Return False
		If ezMessageBox_Button1.Update Then ezMessageBox_Active = False; Return True
		Return False
	End Function
	
	'Summary: Return when the No or cancel button is pressed
	Function NoCancel:Bool()
		If ezMessageBox_Active = False Return False
		If ezMessageBox_Button0.Update Then ezMessageBox_Active = False; Return True
		Return False
	End Function
	
	' Summary: Set the message body, ~r for new lines
	Function SetMessage:Void(msg_text:String)
		ezMessageBox_Text = msg_text.Split("~r")
	End Function
	
	'Summary: Set the title of the message box
	Function SetTitle:Void(title_text:String)
		ezMessageBox_Title = title_text
	End Function
	
End Class