object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'UMS - User Management System'
  ClientHeight = 309
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 290
    Width = 645
    Height = 19
    Panels = <
      item
        Text = 'Version 1.0.0.0'
        Width = 100
      end
      item
        Width = 50
      end>
    ParentShowHint = False
    ShowHint = False
    ExplicitLeft = 328
    ExplicitTop = 160
    ExplicitWidth = 0
  end
end
