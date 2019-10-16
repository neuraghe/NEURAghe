/*
 * Copyright (c) 2012-2014 The Khronos Group Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and/or associated documentation files (the
 * "Materials"), to deal in the Materials without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Materials, and to
 * permit persons to whom the Materials are furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Materials.
 *
 * THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
 */

#ifndef _VX_KHR_XML_H_
#define _VX_KHR_XML_H_

/*! \file
 * \brief The OpenVX XML Schema Extension Header.
 *
 * \defgroup group_xml XML API
 * \brief The OpenVX XML Schema Export and Import API.
 */

#define OPENVX_KHR_XML  "vx_khr_xml"

#include <VX/vx.h>

#ifdef __cplusplus
extern "C" {
#endif

/*! \brief Exports all objects in the context to an XML file which uses the OpenVX
 * XML Schema.
 * \param [in] context The context to export.
 * \param [in] xmlfile The file to write the XML into.
 * \return A <tt>\ref vx_status_e</tt> enumeration.
 * \see http://www.khronos.org/openvx/OpenVX.xsd
 * \ingroup group_xml
 */
vx_status vxExportToXML(vx_context context, vx_char xmlfile[]);


/*! \brief Imports all framework and data objects from an XML file into the given context.
 * \param [in] context The context to import into.
 * \param [in] xmlfile The XML file to read.
 * \param [out] refs The list of <tt>\ref vx_reference</tt>s loaded from the XML file.
 * \param [in,out] numrefs As input, describes the size of the refs array. As output
 * it contains the number of items in the refs array.
 * \note The references in the refs list will correspond with the references in the
 * XML file in the order in which they occured. It is assumed that the Client has
 * some means to know which references to use from the returned list.
 * \return A <tt>\ref vx_status_e</tt> enumeration.
 * \see http://www.khronos.org/openvx/OpenVX.xsd
 * \ingroup group_xml
 */
vx_status vxImportFromXML(vx_context context,
                          vx_char xmlfile[],
                          vx_reference refs[],
                          vx_size *numrefs);

#ifdef __cplusplus
}
#endif

#endif

