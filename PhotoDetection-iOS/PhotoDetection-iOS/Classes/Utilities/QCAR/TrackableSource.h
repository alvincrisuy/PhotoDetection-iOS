/*===============================================================================
Copyright (c) 2012-2014 Qualcomm Connected Experiences, Inc. All Rights Reserved.

Vuforia is a trademark of PTC Inc., registered in the United States and other 
countries.

@file 
    TrackableSource.h

@brief
    Header file for TrackableSource class.
===============================================================================*/
#ifndef _QCAR_TRACKABLESOURCE_H_
#define _QCAR_TRACKABLESOURCE_H_

// Include files:
#include "System.h"
#include "NonCopyable.h"

namespace QCAR
{

/// TrackableSource
/**
 *  An opaque handle for creating a new Trackable in a DataSet.
 */
class QCAR_API TrackableSource : private NonCopyable
{

};

} // namespace QCAR

#endif // _QCAR_TRACKABLESOURCE_H_
