package model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

/***********************************************************************
 * Module:  model.DataAlert
 * Author:  Ratwareid
 * Created: 07/09/2023
 * Info:  If You dont know me ? Just type ratwareid in google.
 ***********************************************************************/
@Getter
@Setter
@AllArgsConstructor
public class AlertData {
    private String bankCode,environment,bankName,port,status;
}

