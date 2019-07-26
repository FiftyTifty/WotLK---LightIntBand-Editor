unit FiftyTiftyAuxFunctions;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls;

  function FindNodeByText(formTree: TTreeView; strToFind: string): TTreeNode;

implementation

function FindNodeByText(formTree: TTreeView; strToFind: string): TTreeNode;
var
  nodeCurrent: TTreeNode;
begin

  nodeCurrent := formTree.Items[0];

    while Assigned(nodeCurrent) do begin

     if nodeCurrent.Text = strToFind then begin
       formTree.Selected := nodeCurrent;
       Break
     end;

     nodeCurrent := nodeCurrent.GetNext;

  end;

  Result := nodeCurrent;

end;

end.
