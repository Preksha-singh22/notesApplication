package com.app.note.bean;

import org.springframework.transaction.annotation.Transactional;


/**
 * Created by Preksha
 */

@Transactional(readOnly=true)
public @interface ReadOnlyTrans {
}
