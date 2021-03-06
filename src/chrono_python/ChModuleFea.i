//////////////////////////////////////////////////
//  
//   ChModuleFea.i
//
//   SWIG configuration file.
//   This is processed by SWIG to create the C::E
//   wrapper for Python.
//
///////////////////////////////////////////////////



// Define the module to be used in Python when typing 
//  'import pychrono.fea'


%module(directors="1") fea


// Turn on the documentation of members, for more intuitive IDE typing

%feature("autodoc", "1");


// Turn on the exception handling to intercept C++ exceptions
%include "exception.i"

%exception {
  try {
    $action
  } catch (const std::exception& e) {
    SWIG_exception(SWIG_RuntimeError, e.what());
  }
}


// For optional downcasting of polimorphic objects:
%include "chrono_downcast.i" 

// For supporting shared pointers:
%include <std_shared_ptr.i>



// Include C++ headers this way...

%{

#include "chrono/fea/ChNodeFEAbase.h"
#include "chrono/fea/ChNodeFEAxyz.h"
#include "chrono/fea/ChNodeFEAxyzP.h"
#include "chrono/fea/ChNodeFEAxyzrot.h"
#include "chrono/fea/ChNodeFEAxyzD.h"
#include "chrono/fea/ChElementBase.h"
#include "chrono/fea/ChElementGeneric.h"
#include "chrono/fea/ChElementSpring.h"
#include "chrono/fea/ChElementBar.h"
#include "chrono/fea/ChElementBeam.h"
#include "chrono/fea/ChElementBeamEuler.h"
#include "chrono/fea/ChElementBeamANCF.h"
#include "chrono/fea/ChElementBeamIGA.h"
#include "chrono/fea/ChElementTetra_4.h"
#include "chrono/fea/ChElementTetra_10.h"
#include "chrono/fea/ChElementHexa_8.h"
#include "chrono/fea/ChElementHexa_20.h"
#include "chrono/fea/ChElementBrick.h"
#include "chrono/fea/ChElementBrick_9.h"
#include "chrono/fea/ChMaterialShellReissner.h"
#include "chrono/fea/ChElementShellReissner4.h"
#include "chrono/fea/ChElementShellANCF.h"
#include "chrono/fea/ChElementShellANCF_8.h"
#include "chrono/fea/ChElementCableANCF.h"
#include "chrono/fea/ChBuilderBeam.h"
#include "chrono/fea/ChMesh.h"
#include "chrono/physics/ChContinuumMaterial.h"
#include "chrono/fea/ChContinuumElectrostatics.h"
#include "chrono/fea/ChContinuumThermal.h"
#include "chrono/fea/ChContactSurface.h"
#include "chrono/fea/ChContactSurfaceMesh.h"
#include "chrono/fea/ChContactSurfaceNodeCloud.h"
#include "chrono/fea/ChMeshSurface.h"
#include "chrono/fea/ChVisualizationFEAmesh.h"
#include "chrono/fea/ChLoadsBeam.h"
#include "chrono/fea/ChLinkDirFrame.h"
#include "chrono/fea/ChLinkPointFrame.h"
#include "chrono/fea/ChLinkPointPoint.h"
#include "chrono/fea/ChMeshFileLoader.h"

using namespace chrono;
using namespace chrono::fea;


%}


// Undefine ChApiFea otherwise SWIG gives a syntax error
#define ChApiFea 
#define ChApi

// workaround for trouble
%ignore chrono::fea::ChContactNodeXYZ::ComputeJacobianForContactPart;
%ignore chrono::fea::ChContactTriangleXYZ::ComputeJacobianForContactPart;
%ignore chrono::fea::ChContactNodeXYZROT::ComputeJacobianForContactPart;
%ignore chrono::fea::ChContactTriangleXYZROT::ComputeJacobianForContactPart;

// Include other .i configuration files for SWIG. 
// These are divided in many .i files, each per a
// different c++ class, when possible.

%include "std_string.i"
%include "std_vector.i"
%include "typemaps.i"

// This is to enable references to double,int,etc. types in function parameters
%pointer_class(int,int_ptr);
%pointer_class(double,double_ptr);
%pointer_class(float,float_ptr);


%template(vector_ChNodeFEAxyzrot) std::vector< std::shared_ptr<chrono::fea::ChNodeFEAxyzrot> >;
%template(vector_ChNodeFEAxyz)    std::vector< std::shared_ptr<chrono::fea::ChNodeFEAxyz> >;

//
// For each class, keep updated the  A, B, C sections: 
// 


//
// A- ENABLE SHARED POINTERS
//
// Note that this must be done for almost all objects (not only those that are
// handled by shered pointers in C++, but all their chidren and parent classes. It
// is enough that a single class in an inheritance tree uses %shared_ptr, and all other in the 
// tree must be promoted to %shared_ptr too).

//from core module:
%shared_ptr(chrono::ChFunction)
%shared_ptr(chrono::ChFrame<double>) 
%shared_ptr(chrono::ChFrameMoving<double>)
%shared_ptr(chrono::ChObj)
%shared_ptr(chrono::ChBodyFrame)
%shared_ptr(chrono::ChPhysicsItem)
%shared_ptr(chrono::ChIndexedNodes)
%shared_ptr(chrono::ChLinkBase)
%shared_ptr(chrono::ChLoadBase)
%shared_ptr(chrono::ChLoadCustom)
%shared_ptr(chrono::ChLoadCustomMultiple)
%shared_ptr(chrono::ChLoadable) 
%shared_ptr(chrono::ChLoadableU) 
%shared_ptr(chrono::ChLoadableUV) 
%shared_ptr(chrono::ChLoadableUVW)
%shared_ptr(chrono::ChNodeBase) 
%shared_ptr(chrono::ChNodeXYZ) 
%shared_ptr(chrono::ChAsset)
%shared_ptr(chrono::ChAssetLevel)
//from this module:
%shared_ptr(chrono::fea::ChBeamSection)
%shared_ptr(chrono::fea::ChBeamSectionBasic)
%shared_ptr(chrono::fea::ChBeamSectionCable)
%shared_ptr(chrono::fea::ChBeamSectionAdvanced)
%shared_ptr(chrono::fea::ChBeamSectionProperties)
%shared_ptr(chrono::fea::ChBeamSectionCosserat)
%shared_ptr(chrono::fea::ChElasticityCosserat)
%shared_ptr(chrono::fea::ChElasticityCosseratSimple)
%shared_ptr(chrono::fea::ChElasticityCosseratGeneric)
%shared_ptr(chrono::fea::ChElasticityCosseratAdvanced)
%shared_ptr(chrono::fea::ChElasticityCosseratMesh)
%shared_ptr(chrono::fea::ChPlasticityCosserat)
%shared_ptr(chrono::fea::ChPlasticityCosseratLumped)
%shared_ptr(chrono::fea::ChDampingCosserat)
%shared_ptr(chrono::fea::ChDampingCosseratLinear)
%shared_ptr(chrono::fea::ChElementBeam)
%shared_ptr(chrono::fea::ChElementBeamEuler)
%shared_ptr(chrono::fea::ChElementBeamANCF)
%shared_ptr(chrono::fea::ChElementBeamIGA)
%shared_ptr(chrono::fea::ChContinuumMaterial)
%shared_ptr(chrono::fea::ChContinuumElastic)
//%shared_ptr(chrono::fea::ChContinuumElastoplastic)
//%shared_ptr(chrono::fea::ChContinuumPlasticVonMises)
//%shared_ptr(chrono::fea::ChContinuumDruckerPrager)
%shared_ptr(chrono::fea::ChContinuumMaterial)
%shared_ptr(chrono::fea::ChContinuumElastoplastic)
%shared_ptr(chrono::fea::ChContinuumPlasticVonMises)
%shared_ptr(chrono::fea::ChContinuumDruckerPrager)
%shared_ptr(chrono::fea::ChContinuumPoisson3D)
%shared_ptr(chrono::fea::ChContinuumElectrostatics)
%shared_ptr(chrono::fea::ChContinuumThermal)
%shared_ptr(chrono::fea::ChElementBase)
%shared_ptr(chrono::fea::ChElementGeneric)
%shared_ptr(chrono::fea::ChElementSpring)
%shared_ptr(chrono::fea::ChElementBar)
%shared_ptr(chrono::fea::ChElement3D)
%shared_ptr(chrono::fea::ChElementCorotational)
%shared_ptr(chrono::fea::ChElementTetrahedron)
%shared_ptr(chrono::fea::ChElementTetra_4)
%shared_ptr(chrono::fea::ChElementTetra_4_P)
%shared_ptr(chrono::fea::ChElementTetra_10)
%shared_ptr(chrono::fea::ChElementHexahedron)
%shared_ptr(chrono::fea::ChElementHexa_8)
%shared_ptr(chrono::fea::ChElementHexa_20)
%shared_ptr(chrono::fea::ChElementBrick)
%shared_ptr(chrono::fea::ChElementBrick_9)
%shared_ptr(chrono::fea::ChNodeFEAbase)
%shared_ptr(chrono::fea::ChNodeFEAxyz)
%shared_ptr(chrono::fea::ChNodeFEAxyzP)
%shared_ptr(chrono::fea::ChNodeFEAxyzD)
%shared_ptr(chrono::fea::ChNodeFEAxyzDD)
%shared_ptr(chrono::fea::ChNodeFEAxyzrot)
%shared_ptr(chrono::fea::ChMesh)
%shared_ptr(chrono::fea::ChContactTriangleXYZ)
%shared_ptr(chrono::fea::ChContactTriangleXYZROT)
%shared_ptr(chrono::fea::ChContactSurface)
%shared_ptr(chrono::fea::ChContactSurfaceMesh)
%shared_ptr(chrono::fea::ChContactSurfaceNodeCloud)
%shared_ptr(chrono::fea::ChMeshSurface)
%shared_ptr(chrono::fea::ChVisulizationFEAmesh)
%shared_ptr(chrono::fea::ChLinkDirFrame)
%shared_ptr(chrono::fea::ChLinkPointFrame)
%shared_ptr(chrono::fea::ChLinkPointPoint)
%shared_ptr(chrono::fea::ChMaterialShellReissner)
%shared_ptr(chrono::fea::ChMaterialShellReissnerIsothropic)
%shared_ptr(chrono::fea::ChMaterialShellReissnerOrthotropic)
%shared_ptr(chrono::fea::ChElementShell)
%shared_ptr(chrono::fea::ChElementShellReissner4)
%shared_ptr(chrono::fea::ChElementShellANCF)
%shared_ptr(chrono::fea::ChElementShellANCF_8)
%shared_ptr(chrono::fea::ChElementCableANCF)
%shared_ptr(chrono::fea::ChBuilderBeam)
%shared_ptr(chrono::fea::ChBuilderBeamIGA)
%shared_ptr(chrono::fea::ChBuilderBeamANCF)
%shared_ptr(chrono::fea::ChLoaderBeamWrench)
%shared_ptr(chrono::fea::ChLoadBeamWrench)
%shared_ptr(chrono::fea::ChLoaderBeamWrenchDistributed)
%shared_ptr(chrono::fea::ChLoadBeamWrenchDistributed)
%shared_ptr(chrono::fea::ChExtruderBeamEuler)
%shared_ptr(chrono::fea::ChExtruderBeamIGA)
%shared_ptr(chrono::fea::ChVisualizationFEAmesh)

//
// B- INCLUDE HEADERS
//
//
// 1) 
//    When including with %include all the .i files, make sure that 
// the .i of a derived class is included AFTER the .i of
// a base class, otherwise SWIG is not able to build the type
// infos. 
//
// 2)
//    Then, this said, if one member function in Foo_B.i returns
// an object of Foo_A.i (or uses it as a parameter) and yet you must %include
// A before B, ex.because of rule 1), a 'forward reference' to A must be done in
// B by. Seems that it is enough to write 
//  mynamespace { class myclass; }
// in the .i file, before the %include of the .h, even if already forwarded in .h

%import(module = "pychrono.core")  "ChClassFactory.i"
%import(module = "pychrono.core")  "ChObject.i"
%import(module = "pychrono.core")  "ChVector.i"
%import(module = "pychrono.core")  "ChQuaternion.i"
%import(module = "pychrono.core")  "ChCoordsys.i"
%import(module = "pychrono.core")  "ChFrame.i"
%import(module = "pychrono.core")  "ChFrameMoving.i"
// Put this 'director' feature _before_ class wrapping declaration.
%feature("director") chrono::ChFunction;
/* Parse the header file to generate wrappers */
%import(module = "pychrono.core") "../chrono/motion_functions/ChFunction_Base.h"
%import(module = "pychrono.core") "../chrono/assets/ChAsset.h"
%import(module = "pychrono.core") "../chrono/assets/ChAssetLevel.h"
%import(module = "pychrono.core")  "ChMaterialSurface.i"
%import(module = "pychrono.core") "../chrono/physics/ChContinuumMaterial.h"
%import(module = "pychrono.core") "../chrono/physics/ChPhysicsItem.h"
%import(module = "pychrono.core") "../chrono/physics/ChIndexedNodes.h"
//%import(module = "pychrono.core") "../chrono/physics/ChLoadable.h" // disable because strange error in cxx
%import(module = "pychrono.core") "../chrono/physics/ChLoad.h"
%import(module = "pychrono.core") "../chrono/physics/ChNodeBase.h"
%import(module = "pychrono.core") "../chrono/physics/ChNodeXYZ.h"
%import(module = "pychrono.core") "../chrono/physics/ChBodyFrame.h"
%import(module = "pychrono.core") "../chrono/physics/ChLinkBase.h"


//  core/  classes
%include "../chrono/physics/ChPhysicsItem.h"
%include "../chrono/fea/ChNodeFEAbase.h"
%include "../chrono/fea/ChNodeFEAxyz.h"
%include "../chrono/fea/ChNodeFEAxyzP.h"
%include "../chrono/fea/ChNodeFEAxyzD.h"
%include "../chrono/fea/ChNodeFEAxyzDD.h"
%include "../chrono/fea/ChNodeFEAxyzrot.h"
%include "../chrono/fea/ChElementBase.h"
%include "../chrono/fea/ChElementGeneric.h"
%include "../chrono/fea/ChElementBar.h"
%include "../chrono/fea/ChElementSpring.h"
%include "../chrono/fea/ChElement3D.h"
%include "../chrono/fea/ChElementCorotational.h"
%include "../chrono/fea/ChBeamSection.h"
%include "../chrono/fea/ChBeamSectionCosserat.h"
%include "../chrono/fea/ChElementBeam.h"
%include "../chrono/fea/ChElementBeamEuler.h"
%include "../chrono/fea/ChElementBeamANCF.h"
%include "../chrono/fea/ChElementBeamIGA.h"
%include "../chrono/fea/ChContinuumPoisson3D.h"
%include "../chrono/fea/ChContinuumElectrostatics.h"
%include "../chrono/fea/ChContinuumThermal.h"
%include "../chrono/fea/ChElementTetrahedron.h"  	
%include "../chrono/fea/ChElementTetra_4.h"
%include "../chrono/fea/ChElementTetra_10.h"
%include "../chrono/fea/ChElementHexahedron.h"		
%include "../chrono/fea/ChElementHexa_8.h"
%include "../chrono/fea/ChElementHexa_20.h"
%include "../chrono/fea/ChElementBrick.h"
%include "../chrono/fea/ChElementBrick_9.h"
%include "../chrono/fea/ChMaterialShellReissner.h"
%include "../chrono/fea/ChElementShell.h"
%include "../chrono/fea/ChElementShellReissner4.h"
%include "../chrono/fea/ChElementShellANCF.h"
%include "../chrono/fea/ChElementShellANCF_8.h"
%include "../chrono/fea/ChElementCableANCF.h"
%include "../chrono/fea/ChContactSurface.h"
%include "../chrono/fea/ChContactSurfaceMesh.h"
%include "../chrono/fea/ChContactSurfaceNodeCloud.h"
%include "../chrono/fea/ChMesh.h"
%include "../chrono/fea/ChMeshSurface.h"
%include "../chrono/fea/ChVisualizationFEAmesh.h"
%include "../chrono/fea/ChLinkDirFrame.h"
%include "../chrono/fea/ChLinkPointFrame.h"
%include "../chrono/fea/ChLinkPointPoint.h"
%include "../chrono/fea/ChLoadsBeam.h"
%include "../chrono/fea/ChBuilderBeam.h"
%include "../chrono/fea/ChMeshFileLoader.h"

//
// C- DOWNCASTING OF SHARED POINTERS
// 
// This is not automatic in Python + SWIG, except if one uses the 
// %downcast_output_sharedptr(...) macro, as above, but this causes
// a lot of code bloat. 
// Alternatively, in the following we create a set of Python-side
// functions to perform casting by hand, thank to the macro 
// %DefChSharedPtrDynamicDowncast(base,derived). 
// Do not specify the "chrono::" namespace before base or derived!
// Later, in python, you can do the following:
//  myvis = chrono.CastToChVisualizationShared(myasset)
//  print ('Could be cast to visualization object?', !myvis.IsNull())

%DefChSharedPtrDynamicDowncast(ChPhysicsItem,ChMesh)
%DefChSharedPtrDynamicDowncast(ChElasticityCosserat,ChElasticityCosseratSimple)
%DefChSharedPtrDynamicDowncast(ChElasticityCosserat,ChElasticityCosseratGeneric)
%DefChSharedPtrDynamicDowncast(ChElasticityCosserat,ChElasticityCosseratAdvanced)
%DefChSharedPtrDynamicDowncast(ChElasticityCosserat,ChElasticityCosseratMesh)
%DefChSharedPtrDynamicDowncast(ChPlasticityCosserat,ChPlasticityCosseratLumped)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementBar)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementSpring)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementTetra_4)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementTetra_10)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementHexa_8)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementHexa_20)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementBeamEuler)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementBeamANCF)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementBeamIGA)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementCableANCF)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementShellReissner4)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementShellANCF)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementShellANCF_8)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementBrick)
%DefChSharedPtrDynamicDowncast(ChElementBase,ChElementBrick_9)
%DefChSharedPtrDynamicDowncast(ChNodeFEAbase,ChNodeFEAxyz)
%DefChSharedPtrDynamicDowncast(ChNodeFEAbase,ChNodeFEAxyzP)
%DefChSharedPtrDynamicDowncast(ChNodeFEAbase,ChNodeFEAxyzD)
%DefChSharedPtrDynamicDowncast(ChNodeFEAbase,ChNodeFEAxyzDD)
%DefChSharedPtrDynamicDowncast(ChNodeFEAbase,ChNodeFEAxyzrot)
%DefChSharedPtrDynamicDowncast(ChAsset,ChVisualizationFEAmesh)

//
// ADDITIONAL C++ FUNCTIONS / CLASSES THAT ARE USED ONLY FOR PYTHON WRAPPER
//

/*
%inline %{


%}
*/


//
// ADD PYTHON CODE
//

/*
%pythoncode %{

%}
*/


