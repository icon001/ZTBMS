  with ARect, Canvas do
   begin

     case CellType of
        ctWeekNor: begin
                     Font.Name := '±¼¸²';
                     Font.Size := 12;
                     Font.Style := [fsBold];
                     Font.Color := clWindowText;
                   end;

        ctWeekSun: begin
                     Font.Name := '±¼¸²';
                     Font.Size := 12;
                     Font.Style := [fsBold];
                     Font.Color := clRed;
                   end;

        ctWeekSat: begin
                     Font.Name := '±¼¸²';
                     Font.Size := 12;
                     Font.Style := [fsBold];
                     Font.Color := clBlue;
                   end;
         ctDayNor: begin
                     Font.Name := 'Times New Roman';
                     Font.Size := 20;
                     if IsToDay then Font.Style := [fsBold,fsUnderLine]
                                else Font.Style := [fsBold];
                     if Selected then Font.Color := clHighlightText
                                 else Font.Color := clWindowText;
                   end;
         ctDaySun: begin
                     Font.Name := 'Times New Roman';
                     Font.Size := 20;
                     if IsToDay then Font.Style := [fsBold,fsUnderLine]
                                else Font.Style := [fsBold];
                     if Selected then Font.Color := clFuchsia
                                 else Font.Color := clRed;
                   end;
         ctDaySat: begin
                     Font.Name := 'Times New Roman';
                     Font.Size := 20;
                     if IsToDay then Font.Style := [fsBold,fsUnderLine]
                                else Font.Style := [fsBold];
                     if Selected then Font.Color := clAqua
                                 else Font.Color := clBlue;
                   end;
     end;

     TextRect(ARect, Left + 3, Top + 3, TheText);


     

     DayHeight := Abs( Font.Height );

     case CellType of
     ctWeekNor,
     ctWeekSun,
     ctWeekSat: begin
                  Pen.Color := clBlack;
                  Pen.Width := 1;

                  MoveTo( ARect.Left, ARect.Top );
                  LineTo( ARect.Right, ARect.Top );

                  MoveTo( ARect.Left, ARect.Bottom - 1 );
                  LineTo( ARect.Right, ARect.Bottom - 1 );

                  case CellType of
                  ctWeekSun: begin
                               MoveTo( ARect.Left, ARect.Top );
                               LineTo( ARect.Left, ARect.Bottom - 1 );
                             end;

                  ctWeekSat: begin
                               MoveTo( ARect.Right - 1, ARect.Top );
                               LineTo( ARect.Right - 1 , ARect.Bottom - 1 );
                             end;
                  end;
                end;

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
                                             else Font.Color := clWindowText;

                     TextRect( BRect, BRect.Left + 10, Top + 13, DayName );
                   end;

                  BRect := ARect;
                  Inc( BRect.Top, DayHeight + 5 );

                  if GetDayTextExists( EncodeDate( Year, Month, Day ) ) then
                   begin
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
     end;

   end;

