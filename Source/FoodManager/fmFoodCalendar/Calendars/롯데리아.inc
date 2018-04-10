  with ARect, Canvas do
   begin

//     if not Selected then Brush.Color := $F5FCE0;

     case CellType of
        ctWeekNor: begin
                     Font.Name := '±¼¸²';
                     Font.Size := 10;
                     Font.Style := [fsBold];
                     Font.Color := clBlack;
                     Brush.Color := $00A0C218;
                   end;

        ctWeekSun: begin
                     Font.Name := '±¼¸²';
                     Font.Size := 10;
                     Font.Style := [fsBold];
                     Font.Color := clWhite;
                     Brush.Color := $00758D12;
                   end;

        ctWeekSat: begin
                     Font.Name := '±¼¸²';
                     Font.Size := 10;
                     Font.Style := [fsBold];
                     Font.Color := clBlack;
                     Brush.Color := $00A0C218;
                   end;
         ctDayNor: begin
                     Font.Name := '±¼¸²';
                     Font.Size := 14;
                     if IsToDay then Font.Style := [fsBold,fsUnderLine]
                                else Font.Style := [fsBold];
                     if Selected then Font.Color := clHighlightText
                                 else Font.Color := clWindowText;
                   end;
         ctDaySun: begin
                     Font.Name := '±¼¸²';
                     Font.Size := 14;
                     if IsToDay then Font.Style := [fsBold,fsUnderLine]
                                else Font.Style := [fsBold];
                     if Selected then Font.Color := clFuchsia
                                 else Font.Color := clRed;
                   end;
         ctDaySat: begin
                     Font.Name := '±¼¸²';
                     Font.Size := 14;
                     if IsToDay then Font.Style := [fsUnderLine]
                                else Font.Style := [fsBold];
                     if Selected then Font.Color := clAqua
                                 else Font.Color := clBlue;
                   end;
          ctBlank: begin
                     Brush.Color := clWhite;
                   end;
     end;

     if IsWeek then FillRect( ARect );
     TextRect(ARect, Left + 3, Top + 4, TheText);

     DayHeight := Abs( Font.Height );

     case CellType of
     ctDayNor,
     ctDaySun,
     ctDaySat : begin
                  if DayName <> '' then
                   begin
                     BRect := ARect;
                     Inc( BRect.Left, TextWidth( TheText ) + 3 );

                     Font.Name := '±¼¸²';
                     Font.Size := 9;
                     Font.Style := [];
                     if gdSelected in AState then Font.Color := clHighlightText
                                             else Font.Color := clGreen;//$00758D12;

                     TextRect( BRect, BRect.Left + 5, Top + 9, DayName );
                   end;

                  BRect := ARect;
                  Inc( BRect.Top, DayHeight + 7 );

                  Strings := TStringList.Create;
                  try
                    if GetDayText( EncodeDate( Year, Month, Day ), Strings ) then
                     begin
                       if gdSelected in AState then Font.Color := clHighlightText
                                               else Font.Color := clWindowText;

                       Font.Name := '±¼¸²';
                       Font.Size := 9;
                       Font.Style := [];

                       CRect := BRect;
                       Inc( CRect.Left, 3 );
                       Dec( CRect.Right, 3 );
                       Dec( CRect.Bottom, 3 );
                       for i := 0 to Strings.Count - 1 do
                        begin
                          CRect.Top := BRect.Top + ( Abs( Font.Height ) + 1 ) * i;
                          TextRect( CRect, CRect.Left, CRect.Top, Strings[i] );
                        end;
                     end;
                  finally
                    Strings.Free;
                  end;
                end;
     end;


     if not IsWeek and ( ( CellText[0, ARow] <> '' ) or ( CellText[7, ARow] <> '' ) ) then
      begin
        Pen.Color := $00A0C218;
        Pen.Width := 1;

        if ARow > 1 then
         begin
           MoveTo( ARect.Right - 7, ARect.Top );
           LineTo( ARect.Left, ARect.Top );
         end
        else
         MoveTo( ARect.Left, ARect.Top );

        if ACol > 0 then
         LineTo( ARect.Left, ARect.Bottom - 7 );
      end;

     if ( ( ARow = RowCount - 2 ) and ( CellText[0, ARow + 1] = '' ) ) or
        ( ( ARow = RowCount - 1 ) and ( CellText[0, ARow] <> '' ) ) then
      begin
        Pen.Width := 3;
        MoveTo( ARect.Left, ARect.Bottom - 1);
        LineTo( ARect.Right, ARect.Bottom  - 1);
      end;

   end;

